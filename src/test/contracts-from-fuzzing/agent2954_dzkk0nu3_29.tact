struct DefaultsInner {
    a: Int = 7;
}

contract OptionalWithDefaults {
    s: DefaultsInner?;
    init() {
        self.s = null;
    }
}
