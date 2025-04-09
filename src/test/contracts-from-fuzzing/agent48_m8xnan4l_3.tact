contract Test {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 42);
        let value: Int = m.get(1)!!;
        dump(value);
    }
}
