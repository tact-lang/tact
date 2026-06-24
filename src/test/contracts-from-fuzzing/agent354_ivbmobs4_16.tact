struct DefaultsNested {
    x: Int = 10;
    y: String = "hello";
}

struct DefaultsOuter {
    foo: Int = 1;
    nested: DefaultsNested = DefaultsNested{};
}

contract DefaultValuesTest {
    data: DefaultsOuter;

    init() {
        self.data = DefaultsOuter{};
    }
}