struct NestedOptionalStruct {
    foo: Int?;
    bar: Bool;
}

struct WrapOptionalStruct {
    nested: NestedOptionalStruct?;
}

contract NestedOptionalField {
    data: WrapOptionalStruct;

    init() {
        self.data = WrapOptionalStruct{
            nested: null
        };
    }
}