/// Loads a [configuration parameter] of TON Blockchain by its `id` number.
///
/// See: https://docs.tact-lang.org/ref/core-contextstate#getconfigparam
///
/// [configuration parameter]: https://docs.ton.org/develop/howto/blockchain-configs
///
asm fun getConfigParam(id: Int): Cell? { CONFIGOPTPARAM }
