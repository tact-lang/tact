contract TestMapGetMissing {
    receive() {
        // create an empty map
        let m: map<Int, Int> = emptyMap();
        // Attempt to retrieve a non-existing key (99)
        let v: Int? = m.get(99);
        dump(v);
    }
}
