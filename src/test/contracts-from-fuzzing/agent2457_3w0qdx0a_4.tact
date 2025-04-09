struct NestedOptional {
    innerOpt: Int?;
    flag: Bool;
}

struct OuterWithNestedOpt {
    nested: NestedOptional?;
    text: String;
}

contract OptionalNestedStructTest {
    data: OuterWithNestedOpt;

    init() {
        self.data = OuterWithNestedOpt{
            nested: null,
            text: "Hello"
        };
    }
}