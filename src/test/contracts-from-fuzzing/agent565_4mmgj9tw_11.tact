struct OptionStruct {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct WrapOption {
    inner: OptionStruct?;
}

contract NestedOptionals {
    field: WrapOption;
    init() {
        self.field = WrapOption{
            inner: OptionStruct{
                a: null,
                b: null,
                c: true,
            },
        };
    }
}