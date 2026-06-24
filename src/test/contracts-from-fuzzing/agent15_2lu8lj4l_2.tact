contract TestPrimitive {
    state: Int = 42;

    // Getter returning a primitive Int
    get fun getValue(): Int {
        return self.state;
    }

    // Required receive so that the contract gets compiled in its entirety
    receive() {}
}
