contract TestDeepEquals {
    receive() {
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        m1.set(1, 10);
        m1.set(2, 20);
        m2.set(1, 10);
        m2.set(2, 20);
        let areEqual: Bool = m1.deepEquals(m2);
        dump(areEqual); // expected output: true
    }
}
