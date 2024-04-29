import { id } from "./id";

let counter = 0;

export function freshIdentifier(prefix: string): string {
    const fresh = `fresh_${prefix}_${counter}`;
    counter += 1;
    return id(fresh);
}
