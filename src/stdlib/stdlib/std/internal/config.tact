/// Loads a [configuration parameter] of TON Blockchain by its `id` number.
/// 
/// [configuration parameter]: https://docs.ton.org/develop/howto/blockchain-configs
/// 
asm fun getConfigParam(id: Int): Cell? { CONFIGOPTPARAM }
