contract TestMaps() {
    fun test() {
        // Test map with Int keys and Int values
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);        // set key 1 to 100
        let x: Int = m.get(1)!!; // retrieve value for key 1, asserted non-null
        dump(x);              // should output 100

        // Test deletion and existence
        let del1 = m.del(1);  // should be true the first time
        dump(del1);
        let del2 = m.del(1);  // deletion on non-existent key, should be false
        dump(del2);
        let exists = m.exists(1); // should be false
        dump(exists);

        // Test shallow equality with emptyMap
        let eqCheck = (m == emptyMap());
        dump(eqCheck);
    }

    receive() { self.test(); }
}
