// Prepare random

/// Global function.
///
/// Randomizes the pseudorandom number generator with the specified unsigned 256-bit `Int` `x` by mixing it with the current seed. The new seed is the unsigned 256-bit `Int` value of the SHA-256 hash of concatenated old seed and `x` in their 32-byte strings big-endian representation.
///
/// Attempts to specify a negative value of `x` throw an exception with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// fun example() {
///     nativeRandomize(42);        // now, random numbers are less predictable
///     let idk: Int = randomInt(); // ???, it's random,
///                                 // but the seed was adjusted deterministically!
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-advanced#nativerandomize
/// * https://docs.tact-lang.org/ref/core-random#randomint
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
/// * https://docs.tact-lang.org/ref/core-advanced#nativerandomizelt
/// * https://docs.tact-lang.org/ref/core-advanced#nativerandomize
/// * https://docs.tact-lang.org/ref/core-advanced#curlt
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
/// * https://docs.tact-lang.org/ref/core-advanced#nativepreparerandom
/// * https://docs.tact-lang.org/ref/core-advanced#nativerandomizelt
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

inline fun randomInt(): Int {
    nativePrepareRandom();
    return nativeRandom();
}

inline fun random(min: Int, max: Int): Int {
    nativePrepareRandom();
    return min + nativeRandomInterval(max - min);
}

// Math

/// Global function.
///
/// Computes and returns the minimum of two `Int` values `x` and `y`.
///
/// ```tact
/// fun examples() {
///     min(1, 2);        // 1
///     min(2, 2);        // 2
///     min(007, 3);      // 3
///     min(0x45, 3_0_0); // 69, nice
///     //  ↑     ↑
///     //  69    300
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-math#min
///
asm fun min(x: Int, y: Int): Int { MIN }

/// Global function.
///
/// Computes and returns the maximum of two `Int` values `x` and `y`.
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
/// Computes and returns the absolute value of the `Int` value `x`.
///
/// ```tact
/// fun examples() {
///     abs(42);        // 42
///     abs(-42);       // 42
///     abs(-(-(-42))); // 42
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-math#abs
///
asm fun abs(x: Int): Int { ABS }

/// Global function.
///
/// Returns the current Unix time.
///
/// ```tact
/// fun example() {
///     let timeOffset: Int = now() + 1000; // thousand seconds from now()
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-common#now
///
asm fun now(): Int { NOW }

/// Global function.
///
/// Computes and returns the logarithm of a number `num` > 0 to the base `base` ≥ 1. Results are rounded down.
///
/// Attempts to specify a non-positive `num` value or a `base` less than 1 throw an error with exit code 5: `Integer out of expected range`.
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
///         log(1024, -2);  // exit code 5 because the base is less than 1
///     }
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-math#log
/// * https://docs.tact-lang.org/ref/core-math#log2
///
@name(__tact_log)
native log(num: Int, base: Int): Int;

/// Global function.
///
/// Similar to `log()`, but sets the `base` to 2.
///
/// Attempts to specify a non-positive `num` value throw an error with exit code 5: `Integer out of expected range`.
///
/// ```tact
/// fun example() {
///     log2(1024); // 10, as 2^10 is 1024
///     //   ↑                ↑       ↑
///     //   num              base₂   num
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-math#log2
/// * https://docs.tact-lang.org/ref/core-math#log
///
asm fun log2(num: Int): Int { DUP 5 THROWIFNOT UBITSIZE DEC }

/// Global function.
///
/// Computes and returns the exponentiation involving two numbers: the `base` and the exponent (or _power_) `exp`. Exponent `exp` must be non-negative, otherwise an error with exit code 5 will be thrown: `Integer out of expected range`.
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
/// See:
/// * https://docs.tact-lang.org/ref/core-math#pow
/// * https://docs.tact-lang.org/ref/core-math#pow2
///
inline fun pow(base: Int, exp: Int): Int {
    throwUnless(5, exp >= 0);
    let result = 1;
    repeat(exp) {
        result *= base;
    }
    return result;
}

/// Global function.
///
/// Similar to `pow()`, but sets the `base` to 2. Exponent `exp` must be non-negative, otherwise an error with exit code 5 will be thrown: `Integer out of expected range`.
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
/// See:
/// * https://docs.tact-lang.org/ref/core-math#pow2
/// * https://docs.tact-lang.org/ref/core-math#pow
///
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
