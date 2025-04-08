struct Combo {
    optInner: Inner?;
    optStr: String?;
    optBool: Bool?;
}

struct Inner {
    value: Int;
}

contract OptionalMixedTest {
    data: Combo;

    init() {
        self.data = Combo {
            optInner: Inner { value: 88 },
            optStr: null,
            optBool: null
        };
    }
}