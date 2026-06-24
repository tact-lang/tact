contract Test {
    v: Int = 123;

    receive () {}

    get fun getInt(): Int {
        return self.v;
    }
}
