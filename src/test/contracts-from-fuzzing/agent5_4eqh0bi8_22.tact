contract MapEqualityTest {
    receive() {
        // Create two local maps with identical entries inserted in different orders
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        
        m1.set(1, 10);
        m1.set(2, 20);
        
        m2.set(2, 20);
        m2.set(1, 10);
        
        let deepEq: Bool = m1.deepEquals(m2);
        let shallowEq: Bool = (m1 == m2);
        
        dump(deepEq);   // Expected output: true
        dump(shallowEq); // Expected output: false (due to differing serialization order)
    }
}
