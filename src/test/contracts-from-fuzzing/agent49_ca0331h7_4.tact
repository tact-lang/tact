contract Test {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(2, 200);
        let a: Int = m.get(2)!!;
    }
}
