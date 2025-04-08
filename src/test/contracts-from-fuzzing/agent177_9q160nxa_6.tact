struct OptionalNest {
    val1: Int?;
    val2: String?;
    val3: Bool?;
    val4: Address?;
}

struct WrapOptional {
    nested: OptionalNest?;
    other: Int;
}

contract OptionalTester {
    data: WrapOptional;
    init() {
        self.data = WrapOptional{
            nested: OptionalNest{
                val1: null,
                val2: "hello",
                val3: true,
                val4: null
            },
            other: 123
        };
    }
}