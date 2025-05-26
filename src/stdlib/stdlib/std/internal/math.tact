// Prepare random

/// Global function.
///
/// Randomizes the pseudorandom number generator with the specified unsigned 256-bit `Int` `x` by mixing it with the current seed. The new seed is the unsigned 256-bit `Int` value of the SHA-256 hash of concatenated old seed and `x` in their 32-byte strings big-endian representation.
///
/// ```tact
/// fun example() {
///     nativeRandomize(42);        // now, random numbers are less predictable
///     let idk: Int = randomInt(); // ???, it's random,
///                                 // but the seed was adjusted deterministically!
/// }
/// ```
///
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to specify a negative value of `x`.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-random#nativerandomize
/// * https://docs.tact-lang.org/ref/core-random#randomint
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
///
asm fun nativeRandomize(x: Int) { ADDRAND }

/// Global function.
///
/// Randomizes the random number generator with the logical time of the current transaction. Equivalent to calling `nativeRandomize(curLt())`.
///
/// ```tact
/// fun example() {
///     nativeRandomizeLt();        // now, random numbers are unpredictable for users,
///                                 // but still may be affected by validators or collators
///                                 // as they determine the seed of the current block.
///     let idk: Int = randomInt(); // ???, it's random!
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-random#nativerandomizelt
/// * https://docs.tact-lang.org/ref/core-random#nativerandomize
/// * https://docs.tact-lang.org/ref/core-contextstate#curlt
/// * https://docs.tact-lang.org/ref/core-random#randomint
///
asm fun nativeRandomizeLt() { LTIME ADDRAND }

/// Global function.
///
/// Prepares a random number generator by using `nativeRandomizeLt()`. Automatically called by `randomInt()` and `random()` functions.
///
/// ```tact
/// fun example() {
///     nativePrepareRandom(); // prepare the RNG
///     // ... do your random things ...
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-random#nativepreparerandom
/// * https://docs.tact-lang.org/ref/core-random#nativerandomizelt
/// * https://docs.tact-lang.org/ref/core-random#randomint
/// * https://docs.tact-lang.org/ref/core-random#random
///
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

/// Generates a new pseudo-random unsigned 256-bit `Int` value `x`.
///
/// The algorithm works as follows: first, the `sha512(r)` is computed. There, `r` is an old
/// value of the random seed, which is taken as a 32-byte array constructed from the big-endian
/// representation of an unsigned 256-bit `Int`. The first 32 bytes of this hash are stored as the new
/// value `r'` of the random seed, and the remaining 32 bytes are returned as the next random value `x`.
///
/// ```tact
/// fun example() {
///     let allYourRandomBelongToUs: Int = randomInt(); // ???, it's random :)
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-random#randomint
///
inline fun randomInt(): Int {
    nativePrepareRandom();
    return nativeRandom();
}

/// Generates a new pseudo-random unsigned `Int` value `x` in the provided semi-closed
/// interval: `min` ≤ `x` < `max`, or `min` ≥ `x` > `max` if both `min` and `max` are negative.
///
/// Note that the `max` value is never included in the interval.
///
/// ```tact
/// fun example() {
///     random(42, 43); // 42, always
///     random(0, 42);  // 0-41, but never 42
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-random#random
///
inline fun random(min: Int, max: Int): Int {
    nativePrepareRandom();
    return min + nativeRandomInterval(max - min);
}

// Math

/// Global function.
///
/// Computes the minimum of two `Int` values `x` and `y`.
///
/// ```tact
/// fun examples() {
///     min(1, 2);        // 1
///     min(2, 2);        // 2
///     min(007, 3);      // 3
///     min(0x42, 3_0_0); // 66, nice
///     //  ↑     ↑
///     //  66    300
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-math#min
///
asm fun min(x: Int, y: Int): Int { MIN }

/// Global function.
///
/// Computes the maximum of two `Int` values `x` and `y`.
///
/// ```tact
/// fun examples() {
///     max(1, 2);        // 2
///     max(2, 2);        // 2
///     max(007, 3);      // 7
///     max(0x45, 3_0_0); // 300
///     //  ↑     ↑
///     //  69    300
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-math#max
///
asm fun max(x: Int, y: Int): Int { MAX }

/// Global function.
///
/// Computes the absolute value of the `Int` value `x`.
///
/// ```tact
/// fun examples() {
///     abs(42);        // 42
///     abs(-42);       // 42
///     abs(-(-(-42))); // 42
/// }
/// ```
///
/// /// #### Exit codes
///
/// * 4: [Integer overflow] — Thrown when the argument equals the minimum representable integer, -2^256.
///
/// See: https://docs.tact-lang.org/ref/core-math#abs
///
/// [Integer overflow]: https://docs.tact-lang.org/book/exit-codes/#4
///
asm fun abs(x: Int): Int { ABS }

/// Global function.
///
/// Computes the logarithm of a number `num` > 0 to the base `base` ≥ 2. Results are rounded down.
///
/// ```tact
/// fun examples() {
///     log(1000, 10); // 3, as 10^3 is 1000
///     //  ↑     ↑             ↑       ↑
///     //  num   base          base    num
///
///     log(1001, 10);  // 3
///     log(999, 10);   // 2
///     try {
///         log(-1000, 10); // exit code 5 because of the non-positive num
///     }
///     log(1024, 2);   // 10
///     try {
///         log(1024, -2);  // exit code 5 because the base is less than 2
///     }
/// }
/// ```
///
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when the given `num` value is non-positive
///   or the given `base` value is less than 2.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-math#log
/// * https://docs.tact-lang.org/ref/core-math#log2
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
///
inline fun log(num: Int, base: Int): Int {
    throwUnless(5, num > 0);
    throwUnless(5, base > 1);
    if (num < base) {
        return 0;
    }

    let result = 0;
    while (num >= base) {
        num /= base;
        result += 1;
    }
    return result;
}

/// Global function.
///
/// Similar to `log()`, but sets the `base` to 2.
///
/// ```tact
/// fun example() {
///     log2(1024); // 10, as 2^10 is 1024
///     //   ↑                ↑       ↑
///     //   num              base₂   num
/// }
/// ```
///
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when the given `num` value is non-positive.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-math#log2
/// * https://docs.tact-lang.org/ref/core-math#log.
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes/#5
///
asm fun log2(num: Int): Int { DUP 5 THROWIFNOT UBITSIZE DEC }

/// Global function.
///
/// Computes the exponentiation involving two numbers: the `base` and the exponent (or _power_) `exp`.
///
/// This function tries to resolve constant values in compile-time whenever possible.
///
/// ```tact
/// contract Example {
///     // Persistent state variables
///     p23: Int = pow(2, 3); // raises 2 to the 3rd power, which is 8
///     one: Int = pow(5, 0); // raises 5 to the power 0, which always produces 1
///                           // works at compile-time!
///
///     // Internal message receiver
///     receive() {
///         pow(self.p23, self.one + 1); // 64, works at run-time too!
///         try {
///             pow(0, -1); // exit code 5: Integer out of expected range
///         }
///     }
/// }
/// ```
///
/// #### Exit codes
///
/// * 4: [Integer overflow] — Thrown when the result exceeds the range of representable integers, i.e. [-2^256; 2^256 - 1].
/// * 5: [Integer out of expected range] — Thrown when the given `exp` value is negative.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-math#pow
/// * https://docs.tact-lang.org/ref/core-math#pow2
///
/// [Integer overflow]: https://docs.tact-lang.org/book/exit-codes/#4
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes/#5
///
inline fun pow(base: Int, exp: Int): Int {
    throwUnless(5, exp >= 0);
    let result = 1;
    repeat (exp) {
        result *= base;
    }
    return result;
}

/// Global function.
///
/// Similar to `pow()`, but sets the `base` to 2.
///
/// This function tries to resolve constant values in compile-time whenever possible.
///
/// ```tact
/// contract Example {
///     // Persistent state variables
///     p23: Int = pow2(3); // raises 2 to the 3rd power, which is 8
///     one: Int = pow2(0); // raises 2 to the power 0, which always produces 1
///                         // works at compile-time!
///
///     // Internal message receiver, which accepts message ExtMsg
///     receive() {
///         pow2(self.one + 1); // 4, works at run-time too!
///         try {
///             pow(-1); // exit code 5: Integer out of expected range
///         }
///     }
/// }
/// ```
///
/// #### Exit codes
///
/// * 4: [Integer overflow] — Thrown when the result exceeds the range of representable integers, i.e. [-2^256; 2^256 - 1].
/// * 5: [Integer out of expected range] — Thrown when attempting to specify a negative value of `exp`.
///
/// See:
/// * https://docs.tact-lang.org/ref/core-math#pow2
/// * https://docs.tact-lang.org/ref/core-math#pow
///
/// [Integer overflow]: https://docs.tact-lang.org/book/exit-codes/#4
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
///
asm fun pow2(exp: Int): Int { POW2 }

/// Global function. Available since Tact 1.6.0.
///
/// Computes the sign of the `Int` value `x`. Produces 1 if the `x` is positive, -1 if the `x` is negative, and 0 if the `x` is 0.
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
/// Computes the rounded up result of division of the numbers `x` and `y`.
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
/// #### Exit codes
///
/// * 4: [Integer overflow] — Thrown when division by zero is attempted or -2^256 is divided by -1.
///
/// See: https://docs.tact-lang.org/ref/core-math#divc
///
/// [Integer overflow]: https://docs.tact-lang.org/book/exit-codes/#4
///
asm fun divc(x: Int, y: Int): Int { DIVC }

/// Global function. Available since Tact 1.6.0.
///
/// Computes the rounded up result of `(x * y) / z`.
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
/// #### Exit codes
///
/// * 4: [Integer overflow] — Thrown when the value in calculation goes beyond
///   the range from -2^256 to 2^256 - 1 inclusive, or if there's an attempt to
///   divide by zero.
///
/// See: https://docs.tact-lang.org/ref/core-math#muldivc
///
/// [Integer overflow]: https://docs.tact-lang.org/book/exit-codes/#4
///
asm fun muldivc(x: Int, y: Int, z: Int): Int { MULDIVC }

/// Global function. Available since Tact 1.6.0.
///
/// Computes the rounded down result of `(x * y) / 2^z`. It is a more gas-efficient equivalent of doing the bitwise shift right on the result of multiplication of `x` and `y`, where `z` is the right operand of the shift.
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
/// #### Exit codes
///
/// * 4: [Integer overflow] — Thrown when the value in calculation goes beyond
///   the range from -2^256 to 2^256 - 1 inclusive.
///
/// * 5: [Integer out of expected range] — Thrown when the given `z` value is
///   outside the inclusive range from 0 to 256.
///
/// See: https://docs.tact-lang.org/ref/core-math#mulshiftright
///
/// [Integer overflow]: https://docs.tact-lang.org/book/exit-codes/#4
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes/#5
///
asm fun mulShiftRight(x: Int, y: Int, z: Int): Int { MULRSHIFT }

/// Global function. Available since Tact 1.6.0.
///
/// Computes `floor((x * y) / 2^z + 0.5)`. It is similar to `mulShiftRight`, but instead of rounding down, the result value is rounded to the nearest integer with results like 42.5 rounded to 43.
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
/// #### Exit codes
///
/// * 4: [Integer overflow] — Thrown when the value in calculation goes beyond
///   the range from -2^256 to 2^256 - 1 inclusive.
///
/// * 5: [Integer out of expected range] — Thrown when the given `z` value is
///   outside the inclusive range from 0 to 256.
///
/// See: https://docs.tact-lang.org/ref/core-math#mulshiftrightround
///
/// [Integer overflow]: https://docs.tact-lang.org/book/exit-codes/#4
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes/#5
///
asm fun mulShiftRightRound(x: Int, y: Int, z: Int): Int { MULRSHIFTR }

/// Global function. Available since Tact 1.6.0.
///
/// Computes `ceil((x * y) / 2^z)`. Similar to `mulShiftRight()`, but instead of rounding down, the result value is rounded up.
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
/// #### Exit codes
///
/// * 4: [Integer overflow] — Thrown when the value in calculation goes beyond
///   the range from -2^256 to 2^256 - 1 inclusive.
///
/// * 5: [Integer out of expected range] — Thrown when the given `z` value is
///   outside the inclusive range from 0 to 256.
///
/// See: https://docs.tact-lang.org/ref/core-math#mulshiftrightceil
///
/// [Integer overflow]: https://docs.tact-lang.org/book/exit-codes/#4
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes/#5
///
asm fun mulShiftRightCeil(x: Int, y: Int, z: Int): Int { MULRSHIFTC }

/// Global function. Available since Tact 1.6.0.
///
/// Computes the square root of the `Int` value `num`. Returns the result rounded to the nearest integer.
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
/// #### Exit codes
///
/// * 5: [Integer out of expected range] — Thrown when attempting to specify a negative value of `num`.
///
/// See: https://docs.tact-lang.org/ref/core-math#sqrt
///
/// [Integer out of expected range]: https://docs.tact-lang.org/book/exit-codes#5
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
