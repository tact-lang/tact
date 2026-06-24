struct DefaultNested {
    a: Int = 5;
    b: Int?;
    c: Nested = Nested{ d: true };
}

struct Nested {
    d: Bool;
}

contract DefaultNestedContract {
    data: DefaultNested;

    init() {
        self.data = DefaultNested{
            a: 42,
            b: null,
            c: Nested{ d: false }
        };
    }
}