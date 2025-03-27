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
/// See: https://docs.tact-lang.org/ref/core-contextstate#now
///
asm fun now(): Int { NOW }

/// Global function. Available since Tact 1.6.0.
///
/// Returns the `Int` value of the logical time of the current transaction.
///
/// ```tact
/// fun example() {
///     let lt: Int = curLt();
///     nativeRandomize(lt); // equivalent to calling nativeRandomizeLt()
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-contextstate#curlt
/// * https://docs.tact-lang.org/ref/core-random#nativerandomize
/// * https://docs.tact-lang.org/ref/core-random#nativerandomizelt
///
asm fun curLt(): Int { LTIME }

/// Global function. Available since Tact 1.6.0.
///
/// Returns the `Int` value of the starting logical time of the current block.
///
/// ```tact
/// fun example() {
///     let time: Int = blockLt();
/// }
/// ```
///
/// See: https://docs.tact-lang.org/ref/core-contextstate#blocklt
///
asm fun blockLt(): Int { BLOCKLT }
