struct NestedOpt {
    inner: Int?;
    flag: Bool;
}

struct ComplexOpt {
    nested: NestedOpt?;
    number: Int;
}

contract ComplexOptTest {
    val: ComplexOpt;

    init() {
        self.val = ComplexOpt{
            nested: null,
            number: 7,
        };
    }
}