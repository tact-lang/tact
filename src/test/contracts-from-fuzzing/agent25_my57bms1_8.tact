contract TestMapDeepEquals {
    receive() {
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        m1.set(1, 100);
        m2.set(1, 100);
        let eq1: Bool = m1.deepEquals(m2); // expected true
        dump(eq1);

        m2.set(2, 200);
        let eq2: Bool = m1.deepEquals(m2); // expected false
        dump(eq2);
    }
}
