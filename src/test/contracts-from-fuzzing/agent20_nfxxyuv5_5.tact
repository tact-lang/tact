contract TestMapReplaceGet {
    receive() {
        // Create an empty local map
        let m: map<Int, Int> = emptyMap();

        // Set a key-value pair: key 1 with value 100
        m.set(1, 100);

        // Case 1: Replace existing key 1; should return old value 100
        let oldVal1: Int? = m.replaceGet(1, 200);
        dump(oldVal1); // expected output: 100
        let newVal1: Int? = m.get(1);
        dump(newVal1); // expected output: 200

        // Case 2: Attempt to replace a non-existent key 2; should return null
        let oldVal2: Int? = m.replaceGet(2, 300);
        dump(oldVal2); // expected output: null
        let newVal2: Int? = m.get(2);
        dump(newVal2); // expected output: null

        // Case 3: Replace existing key 3 with null to delete it
        m.set(3, 300);
        let oldVal3: Int? = m.replaceGet(3, null);
        dump(oldVal3); // expected output: 300
        let newVal3: Int? = m.get(3);
        dump(newVal3); // expected output: null
    }
}
