contract Test {
    receive() {
        // Dump on an Int
        dump(42);
        
        // Dump on a Bool
        dump(true);

        // Dump on an Optional Int (with value and null)
        let opt_with_val: Int? = 42;
        dump(opt_with_val);
        let opt_null: Int? = null;
        dump(opt_null);

        // Dump on a Cell (beginCell() returns a Builder which is allowed)
        dump(beginCell());

        // Dump on a Slice
        dump(emptySlice());

        // Dump on a map: Correct syntax using angle brackets
        let m: map<Int,Int> = emptyMap();
        m.set(2, 4);
        dump(m);

        // Dump result of emit which returns void
        dump(emit("Test message".asComment()));
    }
}
