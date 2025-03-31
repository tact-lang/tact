contract Test {
    m: map<Int, Int> = emptyMap();

    receive() {
        self.m.set(1, 100);
        let val: Int = self.m.get(1)!!;
        dump(val);
    }
}
