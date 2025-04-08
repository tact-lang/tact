struct MixOptNested {
    innerOpt: Int?;
    innerBool: Bool;
}

struct ComplexNested {
    first: MixOptNested?;
    second: Int;
    third: String?;
}

contract NestedOptionalMix {
    data: ComplexNested;

    init() {
        self.data = ComplexNested{
            first: MixOptNested{
                innerOpt: null,
                innerBool: true
            },
            second: 99,
            third: "test"
        };
    }
}
