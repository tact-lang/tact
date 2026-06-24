contract Test {
    m: map<Int, Int>;

    receive() {
        // Test .replaceGet() method
        self.m = emptyMap();
        
        // Set initial key-value pairs
        self.m.set(7, 70);
        self.m.set(42, 42);

        // Replace key 7, expecting to get old value (70)
        let old1: Int? = self.m.replaceGet(7, 68);
        dump(old1!!); // Expected output: 70

        // Attempt to replace non-existent key 8, expecting null
        let old2: Int? = self.m.replaceGet(8, 88);
        if (old2 == null) {
            dump(101); // Expected branch output: 101
        } else {
            dump(999);
        }

        // Using replaceGet to delete key 7 by setting value to null
        let old3: Int? = self.m.replaceGet(7, null);
        dump(old3!!); // Expected output: 68

        // Verify that key 7 is deleted
        if (self.m.exists(7)) {
            dump(0);
        } else {
            dump(202); // Expected output: 202
        }
    }
}
