contract Test {
    receive() {
        // Test 10: Valid usage of map.deepEquals comparing identical maps
        let mapA: map<Int, Int> = emptyMap();
        let mapB: map<Int, Int> = emptyMap();

        mapA.set(1, 100);
        mapA.set(2, 200);
        
        mapB.set(1, 100);
        mapB.set(2, 200);
        
        // deepEquals should return true even if the underlying serialization may differ
        let areEqual: Bool = mapA.deepEquals(mapB);
    }
}
