/*
const minSignedInt = (nBits: number): bigint => -(2n ** (BigInt(nBits) - 1n));

const maxSignedInt = (nBits: number): bigint => (2n ** (BigInt(nBits) - 1n)) - 1n;

const minUnsignedInt = (_nBits: number): bigint => 0n;

const maxUnsignedInt = (nBits: number): bigint => (2n ** BigInt(nBits)) - 1n;

const minVarInt = (size: number): bigint => minSignedInt(8 * (size - 1));

const maxVarInt = (size: number): bigint => maxSignedInt(8 * (size - 1));

const minVarUInt = (_size: number): bigint => 0n;

const maxVarUInt = (size: number): bigint => minUnsignedInt(8 * (size - 1));
*/
