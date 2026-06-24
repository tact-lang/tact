contract TestExternalSenderCall {
    // External receiver: no sender is available, so referencing sender() should cause a compile-time error
    external("test") {
        let s = sender();
    }
}
