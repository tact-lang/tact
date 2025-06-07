contract TestGetterParam {
    base: Int = 10;

    receive() {}

    get fun add(x: Int): Int {
        return x + self.base;
    }
}
