contract TestGetterCorrect {
    v: Int = 0;

    get fun get_value(): Int {
        if (self.v > 10) {
            return self.v;
        } else {
            return 42;
        }
    }
}
