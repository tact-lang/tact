struct NestedOptional {
    val: Int?;
    flag: Bool?;
}

struct Outer {
    nested: NestedOptional?;
    label: String;
}

contract OptionalNestTest {
    data: Outer;

    init() {
        self.data = Outer{
            nested: null,
            label: "test"
        };
    }
}
