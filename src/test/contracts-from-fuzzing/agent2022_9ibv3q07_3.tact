struct NestedOptional {
    inner: Int?;
    innerStr: String?;
}

struct OuterStruct {
    nested: NestedOptional?;
    flag: Bool;
}

contract NestedOptionalField {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: null,
            flag: true
        };
    }
}