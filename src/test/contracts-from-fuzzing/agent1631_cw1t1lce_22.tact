struct NestedMixed {
    intField: Int;
    boolField: Bool;
    stringField: String;
    sub: SubNested;
}

struct SubNested {
    optInt: Int?;
    optStr: String?;
    flag: Bool;
}

contract DeepMix {
    nested: NestedMixed;

    init() {
        self.nested = NestedMixed{
            intField: 9,
            boolField: false,
            stringField: "ok",
            sub: SubNested{
                optInt:null,
                optStr:null,
                flag:true
            }
        };
    }
}