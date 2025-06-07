contract TestGetterWithParam {
    state: Int = 10;

    receive() {}

    // Getter with a single parameter
    get fun add(x: Int): Int {
        return self.state + x;
    }
}
