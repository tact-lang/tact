struct OptionalMix {
    intOpt: Int?;
    boolOpt: Bool?;
    addressOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    stringOpt: String?;
}

struct WrapOptionalMix {
    nested: OptionalMix;
}

contract NestedOptionalMix {
    content: WrapOptionalMix;

    init() {
        self.content = WrapOptionalMix{
            nested: OptionalMix{
                intOpt: 7,
                boolOpt: null,
                addressOpt: null,
                cellOpt: emptyCell(),
                sliceOpt: emptyCell().asSlice(),
                stringOpt: "optional"
            }
        };
    }
}