import { sha256_sync } from "@ton/crypto";

// Witness tag. Do not use, do not export!
const Sha256Tag = Symbol("sha256");

type Sha256 = {
    readonly kind: typeof Sha256Tag;
    readonly value: bigint;
};

export const sha256 = (input: Buffer | string): Sha256 => ({
    kind: Sha256Tag,
    value: bufferToBigInt(sha256_sync(input)),
});

export const sha256LoadUint32BE = (sha: Sha256): bigint =>
    sha.value >> (256n - 32n);

const bufferToBigInt = (buffer: Buffer): bigint =>
    buffer.reduce((acc, byte) => (acc << BigInt(8)) | BigInt(byte), BigInt(0));
