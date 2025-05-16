contract Test {
    a: Int = 0;

    receive(msg: Slice) {
        self.a = 999;
    }
}
