struct OptionalDeep {
    a: Int?;
    b: Bool?;
    nested: NestedOpt?;
}

struct NestedOpt {
    value: Int;
}

contract OptDeepTest {
    d: OptionalDeep;

    init() {
        self.d = OptionalDeep{
            a: null,
            b: null,
            nested: NestedOpt{ value: 7 }
        };
    }
}