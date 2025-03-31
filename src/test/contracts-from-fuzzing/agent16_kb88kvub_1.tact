contract Test1 {
    value: Int = 42;

    receive() {}

    get fun getValue(): Int {
        return self.value;
    }
}
