contract Test {
    v: Int = 42;

    receive() {}

    // Getter that returns a primitive value using self
    get fun get_value(): Int {
        return self.v;
    }
}
