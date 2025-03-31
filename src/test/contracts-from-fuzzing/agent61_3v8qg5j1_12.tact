contract Test {
    receive() {
        // Test: Using hashData() on a regular ASCII string "abc"
        let h: Int = "abc".hashData();
        dump(h);
    }
}
