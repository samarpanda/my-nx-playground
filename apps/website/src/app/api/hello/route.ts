import { mylib } from '@my-nx-playground/mylib';

export async function GET(request: Request) {
  return new Response(`Hello, from API! ${mylib()}`);
}
