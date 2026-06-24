contract Test {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        m.set(42, 42);

        // Test replaceGet for an existing key
        let oldVal1: Int? = m.replaceGet(7, 68); // Expected to return Some(70)
        // Test replaceGet for non-existing key
        let oldVal2: Int? = m.replaceGet(8, 68); // Expected to return null

        if (oldVal1 != null) { dump(oldVal1); } else { dump(0); }  // expect dump: 70
        if (oldVal2 == null) { dump(1); } else { dump(0); }         // expect dump: 1
    }
}
