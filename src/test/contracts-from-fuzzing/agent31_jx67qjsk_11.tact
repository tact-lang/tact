contract Test {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);

        // Test deletion: existant key should be deleted and return true
        let del1: Bool = m.del(1);
        // Non-existent key should return false
        let del2: Bool = m.del(3);

        if (del1 && !del2) { dump(1); } else { dump(0); }
    }
}
