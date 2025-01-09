// Prepare random

// Mixes unsigned 256-bit integer x into the random seed r by setting the random seed
// to sha256 of the concatenation of two 32-byte strings:
// the first with the big-endian representation of the old seed r, and
// the second with the big-endian representation of x.
asm fun nativeRandomize(x: Int) { ADDRAND }

/// Equivalent to `nativeRandomize(cur_lt())`,
/// where `cur_lt()` is the logical time of the current transaction
asm fun nativeRandomizeLt() { LTIME ADDRAND }

@name(__tact_prepare_random)
native nativePrepareRandom();

// Random

// Generates a new pseudo-random unsigned 256-bit integer x.
// The algorithm is as follows: if r is the old value of the random seed,
// considered as a 32-byte array (by constructing the big-endian representation
// of an unsigned 256-bit integer), then its sha512(r) is computed;
// the first 32 bytes of this hash are stored as the new value r' of the random seed,
// and the remaining 32 bytes are returned as the next random value x.
asm fun nativeRandom(): Int { RANDU256 }

// Generates a new pseudo-random integer z in the range 0..range−1
// (or range..−1, if range < 0).
// More precisely, an unsigned random value x is generated as in `nativeRandom`;
// then z := x * range / 2^256 is computed.
asm fun nativeRandomInterval(max: Int): Int { RAND }

inline fun randomInt(): Int {
    nativePrepareRandom();
    return nativeRandom();
}

inline fun random(min: Int, max: Int): Int {
    nativePrepareRandom();
    return min + nativeRandomInterval(max - min);
}

// Math

asm fun min(x: Int, y: Int): Int { MIN }

asm fun max(x: Int, y: Int): Int { MAX }

asm fun abs(x: Int): Int { ABS }

asm fun now(): Int { NOW }

asm fun log2(num: Int): Int {
    DUP 5 THROWIFNOT UBITSIZE DEC
}

@name(__tact_log)
native log(num: Int, base: Int): Int;

@name(__tact_pow)
native pow(base: Int, exp: Int): Int;

asm fun pow2(exp: Int): Int { POW2 }