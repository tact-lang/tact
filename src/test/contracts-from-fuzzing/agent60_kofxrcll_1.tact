contract Test1 {
    value: Int = 42;

    receive() {}

    get fun getVal(): Int {
        return self.value;
    }
}
