contract TestReplaceGet {
    // Test replaceGet: replacing value returns old value
    get fun test(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        let oldVal = m.replaceGet(1, 200); // should replace 100 by 200 and return 100
        if (oldVal == null) { return -1; }
        return oldVal!!;
    }
}
