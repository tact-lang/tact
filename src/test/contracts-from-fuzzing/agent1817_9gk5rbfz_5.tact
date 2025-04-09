struct Nested {
    flag: Bool;
}

struct OuterWithDefault {
    nested: Nested = Nested{flag: true};
    num: Int = 123;
}

contract DefaultsTest {
    state: OuterWithDefault;

    init() {
        self.state = OuterWithDefault{};
    }
}
