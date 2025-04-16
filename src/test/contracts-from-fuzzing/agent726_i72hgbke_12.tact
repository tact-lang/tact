struct WithManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
    d: Int = 2;
    e: Bool = false;
}

contract DefaultsTest {
    storage: WithManyDefaults;

    init() {
        self.storage = WithManyDefaults{};
    }

    receive() {
        self.storage = WithManyDefaults{
            a: 10,
            b: false,
            c: "y",
            d: 20,
            e: true,
        };
    }
}