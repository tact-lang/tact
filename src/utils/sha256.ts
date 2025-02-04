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

/**
 * Extracts the most significant 32 bits from a `BigInt` value representing an SHA-256 hash.
 *
 * Example 1:
 * ```typescript
 * sha.value = BigInt(0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef)
 * ```
 * `sha256LoadUint32BE(sha)` will return `0x12345678`, as the top 32 bits are `0x12345678`.
 *
 *
 * Example 2:
 * ```typescript
 * sha.value = BigInt(0x9876543210fedcba9876543210fedcba9876543210fedcba9876543210fedcba)
 * ````
 * `sha256LoadUint32BE(sha)` will return `0x98765432`, as the top 32 bits are `0x98765432`.
 */
export const highest32ofSha256 = (sha: Sha256): bigint =>
    sha.value >> (256n - 32n);

const bufferToBigInt = (buffer: Buffer): bigint =>
    buffer.reduce((acc, byte) => (acc << 8n) | BigInt(byte), 0n);
