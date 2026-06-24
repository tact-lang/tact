contract Test {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        m.set(42, 42);

        // Replace and get old value for an existing key
        let old1: Int? = m.replaceGet(7, 68); // should return 70
        dump(old1);

        // Replace and attempt on a non-existent key
        let old2: Int? = m.replaceGet(8, 68); // should return null
        dump(old2);

        // Replace with null to delete the key
        let old3: Int? = m.replaceGet(42, null); // should return 42
        dump(old3);
    }
}
