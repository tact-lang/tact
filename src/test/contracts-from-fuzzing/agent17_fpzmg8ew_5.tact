contract GetterOptional {
    // Optional state variable not set, default is null
    value: Int?;

    init() {
        self.value = null; // explicitly set to null
    }

    // Getter returning an optional primitive type
    get fun getValue(): Int? {
        return self.value;
    }

    receive() {}
}
