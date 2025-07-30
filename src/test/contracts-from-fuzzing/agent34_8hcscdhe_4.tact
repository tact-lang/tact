contract Test {
    receive() {
        // Test .replaceGet: replace existing key, non-existing key, and deletion via null replacement
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        let oldVal1: Int? = m.replaceGet(7, 68); // should return 70 and update key 7 to 68
        dump(oldVal1);
        let oldVal2: Int? = m.replaceGet(8, 68); // key 8 doesn't exist, should return null and do nothing
        dump(oldVal2);
        m.set(9, 90);
        let oldVal3: Int? = m.replaceGet(9, null); // replacing with null deletes key 9; should return 90
        dump(oldVal3);
        dump(m.exists(9)); // should be false since key 9 was deleted
    }
}
