contract Test {
    receive() {
        // Dump non-empty builder: create a builder and store an integer
        let b = beginCell();
        let b2 = b.storeInt(42, 32);
        dump(b2); // Expect dump to successfully print a non-empty builder with integer 42 stored
    }
}
