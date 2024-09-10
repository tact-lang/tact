import path from "path";

export const CONTRACTS_DIR = path.join(__dirname, "contracts");

export function trimTrailingCR(input: string): string {
    return input.replace(/\n+$/, "");
}
