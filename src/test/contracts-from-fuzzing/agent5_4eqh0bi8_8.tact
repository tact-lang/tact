contract MapReplaceGetTest {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Set initial values
        self.m.set(7, 70);
        self.m.set(42, 42);

        // Replace existing key 7; should return old value 70
        let oldVal1: Int? = self.m.replaceGet(7, 68);

        // Attempt to replace non-existent key 8; should return null
        let oldVal2: Int? = self.m.replaceGet(8, 68);

        // Replace key 42 with null to delete it; should return 42
        let oldVal3: Int? = self.m.replaceGet(42, null);
        let check: Int? = self.m.get(42); // should be null
    }
}
