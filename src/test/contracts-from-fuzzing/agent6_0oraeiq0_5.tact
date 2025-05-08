contract TestReplaceGet {
    receive() {
        let fizz: map<Int, Int> = emptyMap();
        fizz.set(7, 70);
        fizz.set(42, 42);

        // Case 1: Replace existing key and get old value
        let oldVal1: Int? = fizz.replaceGet(7, 68); // key 7 updated
        dump(oldVal1 !!); // expected output: 70

        // Case 2: Replace non-existing key
        let oldVal2: Int? = fizz.replaceGet(8, 68); // key 8 doesn't exist
        // if null, dump 0
        if (oldVal2 == null) {
            dump(0); // expected output: 0
        } else {
            dump(oldVal2 !!);
        }

        // Case 3: Replace existing key with null to delete the entry
        // Reset key 7
        fizz.set(7, 70);
        let oldVal3: Int? = fizz.replaceGet(7, null); // deletes key 7
        dump(oldVal3 !!); // expected output: 70
        dump(fizz.exists(7)); // expected: false
    }
}
