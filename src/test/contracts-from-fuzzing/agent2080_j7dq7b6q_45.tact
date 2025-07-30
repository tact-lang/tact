struct MixedNested {
    fixed: Int;
    optStruct: OptionalPart?;
}

struct OptionalPart {
    maybeInt: Int?;
    maybeString: String?;
}

contract NestedOptionalStruct {
    value: MixedNested;
    init() {
        self.value = MixedNested{
            fixed: 99,
            optStruct: OptionalPart{
                maybeInt: null,
                maybeString: null
            }
        };
    }
}