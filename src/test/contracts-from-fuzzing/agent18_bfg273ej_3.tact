contract Test {
    receive() {
        // Testing .set() and .get() operations on map<Int, Int>
        let m: map<Int, Int> = emptyMap();
        m.set(1, 42);
        let v: Int? = m.get(1);
    }
}
