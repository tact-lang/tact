struct StringNest {
    inner: String;
    opt: String?;
}

struct Wrap {
    nested: StringNest;
    flag: Bool;
}

contract StringDeep {
    field: Wrap;

    init() {
        self.field = Wrap{
            nested: StringNest{ inner:"test", opt:null },
            flag: true
        };
    }
}