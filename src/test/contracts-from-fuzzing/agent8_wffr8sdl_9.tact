struct EqualityResult {
    deep: Bool;
    shallow: Bool;
}

contract TestMapEquality {
    // This contract tests the equality of two maps created with the same serialization parameters.
    // According to the documentation, if two maps have the same key-value entries, 
    // deepEquals should return true and the shallow equality operator (==) should also return true.
    
    get fun test() : EqualityResult {
        let m1: map<Int as uint8, Int> = emptyMap();
        let m2: map<Int as uint8, Int> = emptyMap();
        
        m1.set(42, 24);
        m2.set(42, 24);
        
        let deep = m1.deepEquals(m2);
        let shallow = m1 == m2;
        
        return EqualityResult{ deep: deep, shallow: shallow };
    }
}
