FROM node:20.18.0-alpine AS base

FROM base AS deps
WORKDIR /app
RUN apk add --no-cache libc6-compat bash curl
COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* ./
RUN \
  if [ -f yarn.lock ]; then yarn --frozen-lockfile; \
  elif [ -f package-lock.json ]; then npm ci; \
  elif [ -f pnpm-lock.yaml ]; then pnpm install --frozen-lockfile --prod; \
  else echo "No lock file found. Please add lock file. Failling the build & Exit." && exit 1; \
  fi

FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
ENV NX_DISTRIBUTED_CACHE=false \
  NX_DISABLE_DB=true \
  NEXT_TELEMETRY_DISABLED=1 \
  NODE_ENV=production

COPY . .
RUN npm run nx build website

FROM base AS runner
WORKDIR /app
ENV NODE_ENV=production \
  NEXT_TELEMETRY_DISABLED=1
COPY apps/website/.env apps/website/.scripts/build/init.sh ./
COPY --from=builder /app/apps/website/public ./apps/website/public
COPY --from=builder /app/apps/website/.next/standalone ./
COPY --from=builder /app/apps/website/.next/static ./apps/website/.next/static
RUN chmod +x init.sh
CMD [ "sh", "init.sh" ]
