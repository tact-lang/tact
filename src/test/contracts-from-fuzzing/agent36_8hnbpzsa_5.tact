contract Test {
    m: map<Int, Int>;

    receive() {
        self.m = emptyMap();
        self.m.set(1, 100);
        let value: Int = self.m.get(1)!!;
        dump(value);
    }
}
