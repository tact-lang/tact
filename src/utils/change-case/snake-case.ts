import { dotCase, type Options } from "@/utils/change-case/dot-case";

export function snakeCase(input: string, options: Options = {}) {
    return dotCase(input, {
        delimiter: "_",
        ...options,
    });
}
