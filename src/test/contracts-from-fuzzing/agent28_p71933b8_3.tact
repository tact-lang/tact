contract Test {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 42);
        let x: Int = m.get(1)!!;
        dump(x);
    }
}