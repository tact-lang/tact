struct NestedOptional {
    value: Int?;
    flag: Bool?;
    text: String?;
}

struct OuterStruct {
    inner: NestedOptional;
    ok: Bool;
}

contract OptionalCombo {
    state: OuterStruct;

    init() {
        self.state = OuterStruct{
            inner: NestedOptional{
                value: null,
                flag: true,
                text: null
            },
            ok: false
        };
    }
}
