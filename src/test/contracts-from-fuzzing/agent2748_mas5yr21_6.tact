struct StrNestOpt {
    field: String?;
    flag: Bool;
}

struct OuterStruct {
    nested: StrNestOpt;
    value: Int;
}

contract NestedOptionals {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: StrNestOpt{
                field: null,
                flag: true
            },
            value: 99
        };
    }
}