contract TestReplace {
    receive() {
        // Test the .replace() and .replaceGet() methods
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        m.set(42, 42);
        
        // Replace existing key with a new value
        let replaced: Bool = m.replace(7, 68); // should be true
        dump(replaced); // expected: true
        
        // Get old value using replaceGet on existing key
        let oldVal: Int? = m.replaceGet(42, 100);
        dump(oldVal!!); // expected old value: 42

        // Try replacing non-existent key
        let failReplace: Bool = m.replace(8, 55);
        dump(failReplace); // expected: false

        // Delete an existing key by replacing with null
        let delResult: Bool = m.replace(7, null);
        dump(delResult); // expected: true

        // ReplaceGet with non-existing key through deletion
        let delValue: Int? = m.replaceGet(8, null);
        if (delValue == null) {
            dump("Key 8 not found"); // expected behavior
        }
    }
}
