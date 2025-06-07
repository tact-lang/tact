contract Test {
    v: Int = 123;

    receive() {}

    get fun getValue(): Int {
        return self.v;
    }
}
