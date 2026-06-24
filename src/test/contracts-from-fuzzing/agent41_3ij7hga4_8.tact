contract Test {
    receive() {
        // Create two identical maps
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        
        m1.set(1, 100);
        m1.set(2, 200);

        m2.set(1, 100);
        m2.set(2, 200);
        
        // Shallow equality using ==
        let shallow: Bool = (m1 == m2);
        dump(shallow); // likely false if serialization differs, but docs say shallow might be false
        
        // Deep equality using .deepEquals()
        let deep: Bool = m1.deepEquals(m2);
        dump(deep); // expected: true because maps have same entries
    }
}
