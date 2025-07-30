contract Test {
    receive() {
        // Test .deepEquals() on maps: comparing maps with same content
        let a: map<Int, Int> = emptyMap();
        let b: map<Int, Int> = emptyMap();
        a.set(1, 2);
        b.set(1, 2);
        // deepEquals returns true if maps have same content regardless of serialization
        let eq: Bool = a.deepEquals(b);
    }
}
