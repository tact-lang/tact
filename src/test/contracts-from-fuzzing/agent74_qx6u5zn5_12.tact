contract TestUnusedGetter {
    value: Int = 123;

    // Getter is declared but not used anywhere in code
    get fun unusedGetter(): Int {
        return self.value;
    }

    receive() {}
}
