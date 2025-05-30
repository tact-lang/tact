contract TestNativeReserve {
    receive() {
        // This contract invokes nativeReserve to preserve part of the balance
        // Reserve at most the given amount and add original balance
        nativeReserve(ton("0.05"), ReserveAtMost | ReserveAddOriginalBalance);
    }
}
