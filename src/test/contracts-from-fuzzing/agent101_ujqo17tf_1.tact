contract Test {
    v: Int = 42;

    receive() {}

    get fun get_value(): Int {
        return self.v;
    }
}
