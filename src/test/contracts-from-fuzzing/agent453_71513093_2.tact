struct OptionalLayer {
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalStruct: NestedOptional?;
}

struct NestedOptional {
    innerOptionalInt: Int?;
    innerOptionalBool: Bool?;
}

contract TestContract {
    data: OptionalLayer;

    init() {
        self.data = OptionalLayer{
            optionalInt: null,
            optionalBool: true,
            optionalStruct: NestedOptional{
                innerOptionalInt: 10,
                innerOptionalBool: null,
            },
        };
    }
}