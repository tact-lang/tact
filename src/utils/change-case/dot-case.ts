import { noCase, Options } from "@/utils/change-case/no-case";

export { Options };

export function dotCase(input: string, options: Options = {}) {
  return noCase(input, {
    delimiter: ".",
    ...options,
  });
}
