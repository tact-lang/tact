struct DeepOptionals {
    fieldA: Int?;
    fieldB: Bool?;
    nested: NestedOptional?;
}

struct NestedOptional {
    value: String?;
    addr: Address?;
}

contract OptionalNest {
    data: DeepOptionals;

    init() {
        self.data = DeepOptionals{
            fieldA: null,
            fieldB: null,
            nested: NestedOptional{
                value: "hello",
                addr: null
            }
        };
    }
}