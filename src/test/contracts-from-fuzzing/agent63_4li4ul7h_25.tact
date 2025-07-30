struct DefaultedInner {
    a: Int = 42;
    b: Bool = false;
}

contract DefaultedStructField {
    data: DefaultedInner;

    init() {
        self.data = DefaultedInner {}; // omit due to defaults
    }
}
