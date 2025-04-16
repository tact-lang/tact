contract Test {
    x: Int = 123;

    receive() {}

    get fun getX(): Int {
        return self.x;
    }
}
