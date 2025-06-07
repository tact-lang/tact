contract Test1 {
    value: Int = 42;

    receive() {}

    // Getter returning a primitive Int
    get fun getValue(): Int {
        return self.value;
    }
}
