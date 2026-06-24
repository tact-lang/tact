struct MidStruct {
    si: String;
    ni: Int;
}

struct OuterStruct {
    ms: MidStruct;
    bs: Bool;
}

contract UseNestedStruct {
    nested: OuterStruct;

    init() {
        self.nested = OuterStruct{
            ms: MidStruct{
                si: "string",
                ni: 22
            },
            bs: true
        };
    }
}