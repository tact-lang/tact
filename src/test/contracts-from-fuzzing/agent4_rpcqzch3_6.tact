contract Test {
    m: map<Int, Int>;

    receive() {
        // Test .isEmpty() method on an empty map
        self.m = emptyMap();
        if (self.m.isEmpty()) {
            dump(1); // expected output: 1 (true)
        } else {
            dump(0);
        }
    }
}
