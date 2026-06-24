contract TestMapReplace {
    receive() {
        // Create an empty map
        let m: map<Int, Int> = emptyMap();
        // Set a couple of values
        m.set(7, 70);
        m.set(42, 42);

        // 1. Replace existing key 7 with a new value 68
        let replaced1: Bool = m.replace(7, 68); // Expected true
        dump(replaced1);

        // 2. Attempt to replace non-existing key 8
        let replaced2: Bool = m.replace(8, 68); // Expected false
        dump(replaced2);

        // 3. Replace existing key 42 with null, which should delete the entry
        let replaced3: Bool = m.replace(42, null); // Expected true
        dump(replaced3);

        // Verify key 42 is deleted
        let v: Int? = m.get(42); // Expected null
        dump(v);
    }
}
