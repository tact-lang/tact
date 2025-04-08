struct NestedOpt {
    val1: Int?;
    val2: Bool?;
}

struct OuterOption {
    nested: NestedOpt?;
    number: Int;
}

contract NestedOptionalTest {
    data: OuterOption;

    init() {
        self.data = OuterOption{ nested: null, number: 42 };
    }
}