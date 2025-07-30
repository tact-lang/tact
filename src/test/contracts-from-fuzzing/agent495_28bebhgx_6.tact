struct OptionalTuple {
    a: Int?;
    b: Bool?;
}

struct WithDefaults {
    num: Int = 42;
    opt: Int?;
    optWithValue: Int? = 5;
    nested: OptionalTuple = OptionalTuple{ a: null, b: true };
}

contract DefaultsTest {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}
