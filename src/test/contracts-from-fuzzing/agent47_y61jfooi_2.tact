contract Test {
    receive() {
        // Simple map usage: set and get with Int keys and Int values using correct generic syntax
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        let v: Int = m.get(1)!!;

        // Additionally, test .exists() method for an existing and a non-existing key
        if (m.exists(1)) {
            dump("Key 1 exists");
        }
        if (!m.exists(2)) {
            dump("Key 2 does not exist");
        }
    }
}
