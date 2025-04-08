struct NestedOpt {
    val: Int?;
    flag: Bool?;
}

struct ComplexOpt {
    count: Int;
    note: String?;
    nested: NestedOpt;
}

contract OptionalNestedTest {
    data: ComplexOpt;

    init() {
        self.data = ComplexOpt{
            count: 42,
            note: null,
            nested: NestedOpt{
                val: null,
                flag: true
            }
        };
    }
}
