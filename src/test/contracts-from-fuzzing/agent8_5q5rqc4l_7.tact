contract TestMapReplaceGet {
    m: map<Int, Int>;

    init() {
        self.m = emptyMap();
        self.m.set(7, 70);
        self.m.set(42, 42);

        // Replace existing key: should return old value (70) and update to 68
        let oldVal1: Int? = self.m.replaceGet(7, 68);
        if (oldVal1 == null || oldVal1 != 70) { throw(0); }
        if (self.m.get(7)!! != 68) { throw(1); }

        // Try replacing non-existing key: should return null, no update
        let oldVal2: Int? = self.m.replaceGet(8, 68);
        if (oldVal2 != null) { throw(2); }

        // Test deletion: replaceGet with null should delete existing key
        let oldVal3: Int? = self.m.replaceGet(42, null);
        if (oldVal3 == null || oldVal3 != 42) { throw(3); }
        if (self.m.exists(42)) { throw(4); }
    }

    receive() {}
}
