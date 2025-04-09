contract Test {
    receive() {
        // Testing .replaceGet() on map<Int, Int>
        let m: map<Int, Int> = emptyMap();
        
        // Set an initial value
        m.set(5, 55);
        
        // Case 1: Replace existing key 5 with value 66, retrieving the old value
        let oldVal: Int? = m.replaceGet(5, 66);
        dump(oldVal!!); // Expect to dump: 55 (old value)
        
        // Verify that the new value is indeed 66
        let newVal: Int = m.get(5)!!;
        dump(newVal); // Expect to dump: 66
        
        // Case 2: Replace a non-existent key 10 with value 100; should return null
        let oldVal2: Int? = m.replaceGet(10, 100);
        if (oldVal2 == null) {
            dump(1); // Dump 1 indicating the key was absent
        } else {
            dump(0);
        }
    }
}
