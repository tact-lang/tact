contract TestMap {
    m: map<Int, Bool>;

    receive() {
        self.m = emptyMap();
        self.m.set(1, true);
        let value: Bool? = self.m.get(1);
        dump(value);
    }
}
