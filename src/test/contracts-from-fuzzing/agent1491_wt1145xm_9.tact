struct DefaultedNested {
    foo: Int = 42;
    bar: Bool = true;
    text: String = "default";
}

contract DefaultedStructField {
    data: DefaultedNested;

    init() {
        self.data = DefaultedNested{};
    }
}