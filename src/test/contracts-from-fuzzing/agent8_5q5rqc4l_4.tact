contract TestMapBasic {
    m: map<Int, Int>;

    init() {
        self.m = emptyMap();
        self.m.set(1, 42);
        let res: Int? = self.m.get(1);
        if (res == null) {
            throw(0);
        }
    }

    receive() {}
}
