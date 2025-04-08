contract MismatchedDefaultsInit {
    foo: Int = 5;
    bar: Bool;

    init() {
        self.bar = true;
    }
}