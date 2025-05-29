contract ThrowInFallbackReceiver {
    receive(_: Slice) {
        // exit codes must be in the range of 0..2^16 - 1
        throw(57896044618658097711785492504343953926634992332820282019728792003956564819968);
    }
}
