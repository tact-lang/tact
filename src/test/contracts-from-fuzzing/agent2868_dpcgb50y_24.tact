struct DefaultNested {
    a: Int = 1;
    b: Nested = Nested{ x: 42 };
}

struct Nested {
    x: Int;
}

contract DefaultNestedStorage {
    val: DefaultNested;

    init() {
        self.val = DefaultNested{};
    }
}