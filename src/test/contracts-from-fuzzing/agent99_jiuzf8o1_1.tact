contract TestPrimitiveGetter {
    v: Int = 42;

    // Standard contract receive
    receive() {}

    // Getter function returning a primitive Int
    get fun getVal(): Int {
        return self.v;
    }
}
