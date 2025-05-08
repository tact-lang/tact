contract Test {
    receive() {
        // Testing map.deepEquals on two maps with identical entries
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        
        m1.set(3, 300);
        m2.set(3, 300);
        
        // deepEquals should return true, as both maps have the same key-value pair
        dump(m1.deepEquals(m2));
    }
}
