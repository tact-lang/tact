struct NestedWithOptional {
    info: Sub;
    label: String?;
}

struct Sub {
    number: Int;
    text: String?;
    flag: Bool;
}

contract OptionalNestedStruct {
    nested: NestedWithOptional;

    init() {
        self.nested = NestedWithOptional{
            info: Sub{
                number: 42,
                text: null,
                flag: false
            },
            label: null
        };
    }
}
