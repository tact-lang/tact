contract PrimitiveGetter {
    counter: Int;

    init() {
        self.counter = 42;
    }

    // Getter returning a primitive type (Int)
    get fun getCounter(): Int {
        return self.counter;
    }

    // receiver to ensure full compilation
    receive() {}
}
