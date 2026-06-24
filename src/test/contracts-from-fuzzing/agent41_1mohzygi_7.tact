contract TestFallback {
    // Test for fallback receiver: receive(msg: Slice)
    receive(msg: Slice) {
        // Dummy operation: do nothing
        let x = 0;
    }

    // Dummy getter to force compilation
    get fun dummy(): Int {
        return 0;
    }
}
