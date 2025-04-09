struct ChildD {
    opt: Int?;
}

struct Parent {
    nested: ChildD;
    flag: Bool;
}

contract OptInStruct {
    p: Parent;

    init() {
        self.p = Parent{
            nested: ChildD{ opt:null },
            flag: true
        };
    }
}