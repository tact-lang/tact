contract Test {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(0, 42);

        // Test exists for an existing key
        if (m.exists(0)) { dump(1); } else { dump(0); }

        // Test exists for non-existent key
        if (!m.exists(1)) { dump(2); } else { dump(0); }
    }
}
