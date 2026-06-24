contract TestBadGetter {
    value: Int;

    init() {
        self.value = 50;
    }

    // Getter that attempts to modify state; should trigger an error as per Tact documentation
    get fun badGetter(): Int {
        self.value = 99;
        return self.value;
    }
}
