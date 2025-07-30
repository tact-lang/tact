contract Test {
    receive() {
        // Testing .replace() operation on map<Int, Int>
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        m.set(42, 42);

        // Test replacing an existing key
        let replaced1: Bool = m.replace(7, 68); // should return true and update key 7 to 68
        let v1: Int? = m.get(7);  // should now be 68

        // Test replacing a non-existing key
        let replaced2: Bool = m.replace(8, 68); // should return false, key 8 doesn't exist

        // Test replacing with null deletes the key
        let replaced3: Bool = m.replace(7, null); // should return true and delete key 7
        let v2: Int? = m.get(7);  // should now be null
    }
}
