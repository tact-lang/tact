contract TestGetterOptional {
    value: Int = 7;

    // Getter returning an optional primitive Int
    get fun getOptionalValue(): Int? {
        if (self.value > 10) {
            return self.value;
        } else {
            return null;
        }
    }

    // The receive function to ensure complete compilation
    receive() {}
}
