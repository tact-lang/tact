contract Test {
    // Map with key type Int and value type Int
    m: map<Int, Int> = emptyMap();

    receive() {
        // Test .replaceGet(): Replace existing key
        self.m.set(10, 200);
        let old1: Int? = self.m.replaceGet(10, 300);
        dump(old1!!); // expected output: 200

        // Test .replaceGet(): Attempt to replace non-existing key
        let old2: Int? = self.m.replaceGet(20, 400);
        if (old2 == null) {
            dump(0); // expected output: 0
        } else {
            dump(1);
        }

        // Test .replaceGet() with null to delete an entry
        self.m.set(15, 150);
        let old3: Int? = self.m.replaceGet(15, null);
        dump(old3!!); // expected output: 150
        let exists15: Bool = self.m.exists(15);
        dump(exists15); // expected output: 0 (false)
    }
}
