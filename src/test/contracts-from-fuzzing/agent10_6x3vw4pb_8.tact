contract TestMapEqualityOrder {
    get fun test() : Int {
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        m1.set(1, 100);
        m1.set(2, 200);
        
        m2.set(2, 200);
        m2.set(1, 100);
        
        // shallow equality check using the == operator, which compares underlying cell hashes
        let shallowEqual = m1 == m2;
        // deep equality check using .deepEquals()
        let deepEqual = m1.deepEquals(m2);
        
        // If deep equality doesn't hold, return error code 1
        if (!deepEqual) { return 1; }
        // Return 42 if deep equals is true, regardless of shallow equality
        return 42;
    }
}
