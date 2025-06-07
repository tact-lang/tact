contract TestReplace {
    receive() {
        let fizz: map<Int, Int> = emptyMap();

        // Case 1: Replace existing key
        fizz.set(7, 70);
        fizz.set(42, 42);
        let rep1: Bool = fizz.replace(7, 68); // should update key 7
        dump(rep1); // expected: true
        let val1: Int? = fizz.get(7); // should be 68
        dump(val1 !!);

        // Case 2: Replace non-existent key
        let rep2: Bool = fizz.replace(8, 68); // no key 8, nothing happens
        dump(rep2); // expected: false

        // Case 3: Replace existing key with null to delete the entry
        let rep3: Bool = fizz.replace(7, null);
        dump(rep3); // expected: true
        let existsAfter: Bool = fizz.exists(7);
        dump(existsAfter); // expected: false
    }
}
