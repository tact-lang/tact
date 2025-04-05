contract MapEqualityTest {
    receive() {
        let m1: map<Int, Int> = emptyMap();
        m1.set(1, 10);
        m1.set(2, 20);
        
        let m2: map<Int, Int> = emptyMap();
        m2.set(2, 20);
        m2.set(1, 10);
        
        // Equality operator performs a shallow comparison (of cell hashes)
        let shallowEqual: Bool = (m1 == m2);
        // deepEquals checks equality of entries (but is more gas-expensive)
        let deepEqual: Bool = m1.deepEquals(m2);
        
        // Use the results in an arithmetic expression
        let result: Int = (shallowEqual ? 10 : 100) + (deepEqual ? 1 : 1000);
        let _ = result;
        return;
    }
}
