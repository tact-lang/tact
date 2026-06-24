contract TestPrimitiveGetter {
    v: Int = 42;

    receive() {}

    // Getter function returning a primitive type (Int)
    get fun getPrimitive(): Int {
        return self.v;
    }
}
