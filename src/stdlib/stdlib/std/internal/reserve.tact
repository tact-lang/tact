/// Executes the `RAWRESERVE` instruction with the specified `amount` and `mode`.
/// It queues the reservation of the specific `amount` of [nanoToncoin] from the remaining
/// account balance per the given `mode`.
///
/// The reservation action is queued to the _output action list_, which contains other actions
/// such as message sends. In fact, the `RAWRESERVE` instruction is roughly equivalent
/// to creating an outbound message carrying the specified `amount` of nanoToncoin
/// or `b - amount` of nanoToncoin, where `b` is the remaining balance, to oneself. This
/// ensures that subsequent output actions cannot spend more money than the remainder.
///
/// It is possible to use raw `Int` values and manually provide them for the `mode`,
/// but for your convenience, there is a set of constants you may use to construct
/// the compound `mode` with ease.
///
/// NOTE: Currently, `amount` must be a non-negative integer, and `mode` must be in the
/// range `0..31`, inclusive.
///
/// Additionally, attempts to queue more than 255 reservations in one transaction throw an
/// exception with [exit code 33]: `Action list is too long`.
///
/// NOTE: This function is gas-expensive and uses 500 gas units or more.
///
/// See: https://docs.tact-lang.org/ref/core-contextstate#nativereserve
///
/// [exit code 33]: https://docs.tact-lang.org/book/exit-codes#33
/// [nanoToncoin]: https://docs.tact-lang.org/book/integers#nanotoncoin
asm fun nativeReserve(amount: Int, mode: Int) { RAWRESERVE }

/// Reserves exactly the specified `amount` of
/// [nanoToncoin](https://docs.tact-lang.org/book/integers#nanotoncoin).
///
/// See: https://docs.tact-lang.org/ref/core-contextstate#nativereserve-base-modes
///
const ReserveExact: Int = 0;

/// Reserves all but the specified `amount` of
/// [nanoToncoin](https://docs.tact-lang.org/book/integers#nanotoncoin).
///
/// See: https://docs.tact-lang.org/ref/core-contextstate#nativereserve-base-modes
///
const ReserveAllExcept: Int = 1;

/// Reserves at most the specified `amount` of
/// [nanoToncoin](https://docs.tact-lang.org/book/integers#nanotoncoin).
///
/// See: https://docs.tact-lang.org/ref/core-contextstate#nativereserve-base-modes
///
const ReserveAtMost: Int = 2;

/// Increases the `amount` by the original balance of the current account
/// (before the compute phase), including all extra currencies.
///
/// See: https://docs.tact-lang.org/ref/core-contextstate#nativereserve-optional-flags
///
const ReserveAddOriginalBalance: Int = 4;

/// Negates the `amount` value before performing the reservation.
///
/// See: https://docs.tact-lang.org/ref/core-contextstate#nativereserve-optional-flags
///
const ReserveInvertSign: Int = 8;

/// Bounces the transaction if the reservation fails.
///
/// See: https://docs.tact-lang.org/ref/core-contextstate#nativereserve-optional-flags
///
const ReserveBounceIfActionFail: Int = 16;
