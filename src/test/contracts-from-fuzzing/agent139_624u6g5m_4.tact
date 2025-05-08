struct NestedOptional {
    inner: Int?;
    text: String?;
}

struct ContainsNested {
    part: NestedOptional;
    number: Int;
}

contract NestedOptionalContract {
    data: ContainsNested;

    init() {
        self.data = ContainsNested{
            part: NestedOptional{ inner: null, text: null },
            number: 123
        };
    }
}