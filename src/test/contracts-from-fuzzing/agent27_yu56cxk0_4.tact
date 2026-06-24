contract TestBasicMap {
    // Basic operations on map<Int, Int>
    get fun f() : Int {
        let foo: map<Int, Int> = emptyMap();
        // Check if the map is initially empty
        let zero: Int = foo.isEmpty() == true ? 1 : 1000;
        foo.set(42, 100);
        // Check if key 42 exists
        let one: Int = foo.exists(42) == true ? 1 : 1000;
        // Return sum: 100 (value) + indicators: should equal 102 if tests pass
        return foo.get(42)!! + zero + one;
    }
}
