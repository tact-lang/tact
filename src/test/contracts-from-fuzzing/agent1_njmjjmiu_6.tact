contract MapReplaceTest {
    receive() {
        // Test the .replace() method of maps
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        m.set(42, 42);

        let rep1: Bool = m.replace(7, 68); // key 7 exists, expect true
        dump(rep1);

        let rep2: Bool = m.replace(8, 68); // key 8 does not exist, expect false
        dump(rep2);
    }
}
