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

// floor(log2(num))
asm fun log2(num: Int): Int {
    DUP 5 THROWIFNOT UBITSIZE DEC
}

// floor(log(num, base))
@name(__tact_log)
native log(num: Int, base: Int): Int;

@name(__tact_pow)
native pow(base: Int, exp: Int): Int;

asm fun pow2(exp: Int): Int { POW2 }

asm fun sign(x: Int): Int { SGN }

// ceil(x/y)
asm fun divc(x: Int, y: Int): Int { DIVC }

// ceil(x*y/z)
asm fun muldivc(x: Int, y: Int, z: Int): Int { MULDIVC }

// floor(x*y/2^z)
asm fun mulShiftRight(x: Int, y: Int, z: Int): Int { MULRSHIFT }

// round(x*y/2^z)
asm fun mulShiftRightRound(x: Int, y: Int, z: Int): Int { MULRSHIFTR }

// ceil(x*y/2^z)
asm fun mulShiftRightCeil(x: Int, y: Int, z: Int): Int { MULRSHIFTC }

// round(sqrt(num))
fun sqrt(num: Int): Int {
    if (num == 0) {
        return 0;
    }

    let s: Int = log2(num);
    let x: Int = (s == 1 ? (num - 1) / 2 + 1 : 1 << ((s + 1) / 2));

    let q: Int = 0;

    do {
        q = (divc(num, x) - x) / 2;
        x += q;
    } until (q == 0);

    return x;
}
