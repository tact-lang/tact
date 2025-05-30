contract Test {
    v: Int = 42;
    receive() {}

    get fun getInt(): Int {
        return self.v;
    }
}
