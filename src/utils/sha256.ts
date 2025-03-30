/* eslint-disable @typescript-eslint/no-require-imports */
function sha256Sync(input: string): bigint {
    // eslint-disable-next-line @typescript-eslint/ban-ts-comment
    // @ts-ignore
    const isBrowser = typeof window !== 'undefined' || typeof document !== 'undefined';

    const hex = isBrowser
        ? require('sha.js')('sha256').update(input, 'utf8').digest('hex')
        : require('crypto').createHash('sha256').update(input, 'utf8').digest('hex');

    return BigInt('0x' + hex);
}

// Witness tag. Do not use, do not export!
const Sha256Tag = Symbol("sha256");

type Sha256 = {
    readonly kind: typeof Sha256Tag;
    readonly value: bigint;
};

export const sha256 = (input: string): Sha256 => ({
    kind: Sha256Tag,
    value: sha256Sync(input),
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
