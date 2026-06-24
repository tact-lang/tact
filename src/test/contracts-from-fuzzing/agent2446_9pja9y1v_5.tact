struct DefaultsNested {
    a: Int = 5;
    b: Bool = false;
    c: String = "hello";
}

contract DefaultsContract {
    nested: DefaultsNested;

    init() {
        self.nested = DefaultsNested{};
    }
}