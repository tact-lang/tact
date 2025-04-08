struct HasInnerOption {
    opt: Int?;
    flag: Bool;
}

struct Nested {
    inner: HasInnerOption;
    num: Int;
}

contract OptStructNestedInStruct {
    field: Nested;

    init() {
        self.field = Nested{
            inner: HasInnerOption{opt:null, flag:true},
            num: 999
        };
    }
}
