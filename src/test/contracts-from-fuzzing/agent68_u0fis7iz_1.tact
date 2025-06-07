contract GetterInt {
    x: Int = 123;

    receive() {}

    get fun getX(): Int {
        return self.x;
    }
}
