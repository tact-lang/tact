contract ThrowInFallbackReceiver {
    receive(_: Slice) {
        // exit codes must be in the range of 0..2^16 - 1
        throw(-14);
    }
}
