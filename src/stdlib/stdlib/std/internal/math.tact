// Prepare random

// Mixes unsigned 256-bit integer x into the random seed r by setting the random seed
// to sha256 of the concatenation of two 32-byte strings:
// the first with the big-endian representation of the old seed r, and
// the second with the big-endian representation of x.
asm fun nativeRandomize(x: Int) { ADDRAND }

// Equivalent to `nativeRandomize(cur_lt())`,
// where `cur_lt()` is the logical time of the current transaction
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

/// Global function. Available since Tact 1.6.0.
///
/// Computes and returns the sign of the `Int` value `x`. Produces 1 if the `x` is positive, -1 if the `x` is negative, and 0 if the `x` is 0.
///
/// ```tact
/// fun examples() {
///     sign(42);        // 1
///     sign(-42);       // -1
///     sign(-(-42));    // 1
///     sign(-(-(-42))); // -1
///     sign(0);         // 0
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-math#sign
///
asm fun sign(x: Int): Int { SGN }

/// Global function. Available since Tact 1.6.0.
///
/// Computes and returns the rounded up result of division of the `Int` `x` by the `Int` `y`.
///
/// Attempts to divide by `y` equal to 0 throw an exception with exit code 4: `Integer overflow`.
///
/// ```tact
/// fun examples() {
///     divc(4, 2);  // 2
///     divc(3, 2);  // 2
///     divc(-4, 2); // -2
///     divc(-3, 2); // -1
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-math#divc
///
asm fun divc(x: Int, y: Int): Int { DIVC }

/// Global function. Available since Tact 1.6.0.
///
/// Computes and returns the rounded up result of `(x * y) / z`.
///
/// If the value in calculation goes beyond the range from -2^256 to 2^256 - 1 inclusive, or if there's an attempt to divide by `z` equal to 0, an exception with exit code 4 is thrown: `Integer overflow`.
///
/// ```tact
/// fun examples() {
///     muldivc(4, 1, 2);  // 2
///     muldivc(3, 1, 2);  // 2
///     muldivc(-4, 1, 2); // -2
///     muldivc(-3, 1, 2); // -1
///     muldivc(-3, 0, 2); // 0
///     muldivc(-3, 0, 0); // ERROR! Exit code 4: Integer overflow
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-math#muldivc
///
asm fun muldivc(x: Int, y: Int, z: Int): Int { MULDIVC }

/// Global function. Available since Tact 1.6.0.
///
/// Computes and returns the rounded down result of `(x * y) / 2^z`. It is a more gas-efficient equivalent of doing the bitwise shift right on the result of multiplication of `Int` `x` times `Int` `y`, where `Int` `z` is the right operand of the shift.
///
/// If the value in calculation goes beyond the range from -2^256 to 2^256 - 1 inclusive, an exception with exit code 4 is thrown: `Integer overflow`.
///
/// Attempts to specify any value of `z` outside the inclusive range from 0 to 256 throw an exception with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// fun examples() {
///     mulShiftRight(5, 5, 2);  // 6
///     mulShiftRight(5, 5, 1);  // 12
///     mulShiftRight(5, 5, 0);  // 25
///     mulShiftRight(5, 5, -1); // ERROR! Exit code 5: Integer out of expected range
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-math#mulshiftright
///
asm fun mulShiftRight(x: Int, y: Int, z: Int): Int { MULRSHIFT }

/// Global function. Available since Tact 1.6.0.
///
/// Similar to `mulShiftRight()`, but instead of rounding down, the result value is rounded to the nearest integer. If there are two equally close integers, rounding is done toward the even one.
///
/// If the value in calculation goes beyond the range from -2^256 to 2^256 - 1 inclusive, an exception with exit code 4 is thrown: `Integer overflow`.
///
/// Attempts to specify any value of `z` outside the inclusive range from 0 to 256 throw an exception with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// fun examples() {
///     mulShiftRightRound(5, 5, 2);  // 6
///     mulShiftRightRound(5, 5, 1);  // 13
///     mulShiftRightRound(5, 5, 0);  // 25
///     mulShiftRightRound(5, 5, -1); // ERROR! Exit code 5: Integer out of expected range
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-math#mulshiftrightround
///
asm fun mulShiftRightRound(x: Int, y: Int, z: Int): Int { MULRSHIFTR }

/// Global function. Available since Tact 1.6.0.
///
/// Similar to `mulShiftRight()`, but instead of rounding down, the result value is rounded up.
///
/// If the value in calculation goes beyond the range from -2^256 to 2^256 - 1 inclusive, an exception with exit code 4 is thrown: `Integer overflow`.
///
/// Attempts to specify any value of `z` outside the inclusive range from 0 to 256 throw an exception with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// fun examples() {
///     mulShiftRightCeil(5, 5, 2);  // 7
///     mulShiftRightCeil(5, 5, 1);  // 13
///     mulShiftRightCeil(5, 5, 0);  // 25
///     mulShiftRightCeil(5, 5, -1); // ERROR! Exit code 5: Integer out of expected range
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-math#mulshiftrightceil
///
asm fun mulShiftRightCeil(x: Int, y: Int, z: Int): Int { MULRSHIFTC }

/// Global function. Available since Tact 1.6.0.
///
/// Computes the square root of the `Int` value `num`. Returns the result rounded to the nearest integer. If there are two equally close integers, rounding is done toward the even one.
///
/// Attempts to specify a negative value of `num` throw an exception with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// fun examples() {
///     sqrt(4);  // 2
///     sqrt(3);  // 2
///     sqrt(2);  // 1
///     sqrt(1);  // 1
///     sqrt(0);  // 0
///     sqrt(-1); // ERROR! Exit code 5: Integer out of expected range
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-math#sqrt
///
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
