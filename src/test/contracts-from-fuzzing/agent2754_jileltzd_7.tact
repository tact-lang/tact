struct InnerStruct {
    flag: Bool;
    s: String?;
}

struct OuterStruct {
    inn: InnerStruct?;
    num: Int;
}

contract NullableNest {
    persistent: OuterStruct;

    init() {
        self.persistent = OuterStruct{
            inn: null,
            num: 99
        };
    }
}
