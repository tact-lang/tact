struct NestStrings {
    inner: String?;
}

struct OuterStrings {
    field: NestStrings?;
}

contract NestedOptionalStrings {
    data: OuterStrings;

    init() {
        self.data = OuterStrings{
            field: NestStrings{
                inner: "deep"
            }
        };
    }
}