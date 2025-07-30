contract UnusedGetter {
    value: Int = 100;

    receive() {}

    // Getter function that is declared but never used
    get fun unused(): Int {
        return self.value;
    }
}
