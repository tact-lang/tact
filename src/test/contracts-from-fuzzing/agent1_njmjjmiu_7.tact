contract MapReplaceGetTest {
    receive() {
        // Test the .replaceGet() method of maps
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        m.set(42, 42);

        // Replace key 7 with a new value, expect to get old value 70
        let oldVal1: Int? = m.replaceGet(7, 68);
        dump(oldVal1!!); // expected output: 70

        // Try replace key 8 which does not exist, expect null
        let oldVal2: Int? = m.replaceGet(8, 68);
        dump(oldVal2); // expected output: null

        // Replace key 7 with null, which should delete the entry, expect old value 68
        let oldVal3: Int? = m.replaceGet(7, null);
        dump(oldVal3!!); // expected output: 68

        // Verify that key 7 has been deleted
        dump(m.exists(7)); // expected output: false
    }
}
