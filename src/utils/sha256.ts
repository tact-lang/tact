import { sha256_sync } from "@ton/crypto";

// Witness tag. Do not use, do not export!
const Sha256Tag = Symbol("sha256");

type Sha256 = { readonly kind: typeof Sha256Tag; readonly value: Buffer };

export const sha256 = (input: Buffer | string): Sha256 => ({
    kind: Sha256Tag,
    value: sha256_sync(input),
});
