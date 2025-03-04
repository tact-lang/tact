/// Calls the native `raw_reserve` function with the specified amount and mode.
/// The `raw_reserve` function creates an output action to reserve a specific amount of 
/// [nanoToncoin] from the remaining balance of the account.
/// 
/// It has the following signature in FunC:
/// 
/// ```func
/// raw_reserve(int amount, int mode) impure asm "RAWRESERVE";
/// ```
/// 
/// The function takes two arguments:
/// * `amount`: The number of [nanoToncoin] to reserve.
/// * `mode`: Determines the reservation behavior.
/// 
/// The function `raw_reserve` is roughly equivalent to creating an outbound message 
/// carrying the specified `amount` of [nanoToncoins] (or `b - amount` [nanoToncoins], 
/// where `b` is the remaining balance) to oneself. 
/// This ensures that subsequent output actions cannot spend more money than the remainder.
/// 
/// It is possible to use raw `Int` values and manually provide them for the `mode`, 
/// but for your convenience, there's a set of constants you may use to construct the 
/// compound `mode` with ease.
/// 
/// NOTE: Currently, `amount` must be a non-negative integer, and `mode` must be in the
/// range `0..31`, inclusive.
/// 
/// Additionally, attempts to queue more than 255 reservations in one transaction throw an
/// exception with [exit code 33]: `Action list is too long`.
/// 
/// NOTE: This function is gas-expensive and uses 500 gas units or more.
/// 
/// [exit code 33]: https://docs.tact-lang.org/book/exit-codes#33
/// [nanoToncoin]: https://docs.tact-lang.org/book/integers#nanotoncoin
asm fun nativeReserve(amount: Int, mode: Int) { RAWRESERVE }

/// Reserves exactly the specified `amount` of [nanoToncoin](https://docs.tact-lang.org/book/integers#nanotoncoin).
const ReserveExact: Int = 0;

/// Reserves all but the specified `amount` of [nanoToncoins](https://docs.tact-lang.org/book/integers#nanotoncoin).
const ReserveAllExcept: Int = 1;

/// Reserves at most the specified `amount` of [nanoToncoins](https://docs.tact-lang.org/book/integers#nanotoncoin).
const ReserveAtMost: Int = 2;

/// Increases the `amount` by the original balance of the current account (before the compute phase), including all extra currencies.
const ReserveAddOriginalBalance: Int = 4;

/// Negates the `amount` value before performing the reservation.
const ReserveInvertSign: Int = 8;

/// Bounces the transaction if the reservation fails.
const ReserveBounceIfActionFail: Int = 16;
