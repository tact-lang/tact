contract Test {
    receive() {
        // Testing .exists() on map<Int, Int>
        let m: map<Int, Int> = emptyMap();
        m.set(5, 100);
        let exists5: Bool = m.exists(5);  // expected to be true
        let exists10: Bool = m.exists(10); // expected to be false
    }
}
