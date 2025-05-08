contract TestReplaceGet {
    m: map<Int, Int>;

    receive() {
        // Initialize empty map and set values
        self.m = emptyMap();
        self.m.set(7, 70);
        self.m.set(42, 42);

        // Replace value for existing key 7; should return old value 70
        let oldVal1: Int? = self.m.replaceGet(7, 68);
        dump(oldVal1!!); // expected output: 70
        // Verify new value
        let newVal: Int = self.m.get(7)!!;
        dump(newVal); // expected output: 68

        // Try to replace a non-existent key 8; should return null
        let oldVal2: Int? = self.m.replaceGet(8, 68);
        if (oldVal2 == null) {
            dump(100); // expected dump: 100 indicating null returned
        } else {
            dump(0);
        }

        // Test deletion via replaceGet: set key 42 to null
        let oldVal3: Int? = self.m.replaceGet(42, null);
        dump(oldVal3!!); // expected output: 42
        // Verify deletion
        if (self.m.get(42) == null) {
            dump(200); // expected dump: 200 indicating deletion successful
        } else {
            dump(0);
        }
    }
}
