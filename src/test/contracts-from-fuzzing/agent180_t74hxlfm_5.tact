contract Test5 {
    // Test for fallback binary message receiver using Slice
    receive(msg: Slice) {
        // minimal implementation
    }

    get fun dummy(): Int {
        return 5;
    }
}
