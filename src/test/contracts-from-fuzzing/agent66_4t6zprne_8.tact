contract Test {
    const A: Int = 123;

    get fun getA(): Int {
        return self.A;
    }

    receive() {}
}
