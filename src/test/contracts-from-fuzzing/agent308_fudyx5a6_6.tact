struct DefaultFieldOrder {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
    d: Int = 42;
    e: Bool? = null;
}

contract DefaultsOrder {
    stored: DefaultFieldOrder;

    init() {
        self.stored = DefaultFieldOrder{};
    }
}
