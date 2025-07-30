contract Test {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        let r: Int = m.get(1)!!;
        dump(r);
    }
}