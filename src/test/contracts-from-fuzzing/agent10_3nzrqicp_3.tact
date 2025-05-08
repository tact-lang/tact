contract TestSetGet {
    m: map<Int, Int> = emptyMap();

    init() {
        self.m.set(1, 42);
    }

    receive() {
        let x: Int = self.m.get(1)!!;
    }
}
