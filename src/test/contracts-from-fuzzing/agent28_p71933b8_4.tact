contract Test {
    receive() {
        // Test .exists() method
        let m: map<Int, Int> = emptyMap();
        m.set(42, 123);
        let found: Bool = m.exists(42);
        dump(found); // expected to dump true
        let notFound: Bool = m.exists(100);
        dump(notFound); // expected to dump false
    }
}