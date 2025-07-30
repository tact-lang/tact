struct InnerLevel2 {
    deepestInt: Int;
    deepestBool: Bool?;
}

struct InnerLevel1 {
    innerInt: Int?;
    nested: InnerLevel2;
}

struct OuterMost {
    level1: InnerLevel1;
    optString: String?;
}

contract DeepNestedContract {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            level1: InnerLevel1{
                innerInt: null,
                nested: InnerLevel2{
                    deepestInt: 123,
                    deepestBool: true,
                },
            },
            optString: "optional",
        };
    }

    receive() {}
}