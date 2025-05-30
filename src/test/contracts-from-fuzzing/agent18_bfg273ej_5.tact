contract Test {
    receive() {
        // Testing .replaceGet() operation on map<Int, Int>
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        m.set(42, 42);

        // Replace existing key: should return old value
        let oldVal1: Int? = m.replaceGet(7, 68); // old value should be 70
        let v1: Int? = m.get(7); // should now be 68

        // Replace non-existing key: should return null
        let oldVal2: Int? = m.replaceGet(8, 68); // nothing to replace, so returns null

        // Replace with null: should delete the key and return the old value
        let oldVal3: Int? = m.replaceGet(7, null); // returns 68 and deletes key 7
        let v2: Int? = m.get(7); // should now be null
    }
}
