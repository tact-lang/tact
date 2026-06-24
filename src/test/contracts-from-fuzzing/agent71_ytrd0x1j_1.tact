contract TestPrimitiveGetter {
    // State variable
    value: Int = 42;

    // Dummy receive function so that all functions are compiled
    receive() {}

    // Getter returning a primitive Int value
    get fun getInt(): Int {
        return self.value;
    }
}
