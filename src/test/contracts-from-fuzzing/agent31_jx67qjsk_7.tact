contract Test {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        m.set(42, 42);

        // Test replacing existing key
        let replaced1: Bool = m.replace(7, 68); // Should return true
        // Test replacing non-existing key
        let replaced2: Bool = m.replace(8, 68); // Should return false

        if (replaced1) { dump(1); } else { dump(0); }
        if (!replaced2) { dump(2); } else { dump(0); }
    }
}
