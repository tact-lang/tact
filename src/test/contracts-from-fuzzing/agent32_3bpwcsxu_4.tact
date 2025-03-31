contract Test {
    m: map<Int, Int> = emptyMap();

    receive() {
        self.m.set(42, 123);
        let res: Int = self.m.get(42)!!;
        dump(res);
    }
}
