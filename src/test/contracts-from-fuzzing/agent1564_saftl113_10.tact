struct OptionalNested {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

struct ContainsOptionalNested {
    nested: OptionalNested?;
}

contract NestedOptionalsTest {
    data: ContainsOptionalNested;

    init() {
        self.data = ContainsOptionalNested{
            nested: OptionalNested{
                optInt: null,
                optBool: true,
                optString: "hello"
            }
        };
    }
}