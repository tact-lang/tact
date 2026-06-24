struct NestedOptional {
    foo: Int?;
    bar: Bool?;
}

struct Base {
    nopt: NestedOptional?;
}

contract OptionalNestedStructTest {
    data: Base;
    init() {
        self.data = Base{ nopt: NestedOptional{ foo: null, bar: true } };
    }
}
