struct NestedOptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct WrapperStruct {
    nested: NestedOptionalStruct;
}

contract OptNestedStructContract {
    data: WrapperStruct;

    init() {
        self.data = WrapperStruct{
            nested: NestedOptionalStruct{
                a: null,
                b: null,
                c: null
            }
        };
    }
}