struct MultipleNested {
    s1: S1;
    s2: S2;
}

struct S1 {
    val: Int;
    opt: Inner?;
}

struct S2 {
    flag: Bool;
}

struct Inner {
    d: String;
}

contract NestingFields {
    f: MultipleNested;
    init() {
        self.f = MultipleNested{
            s1: S1{val:5,opt:null},
            s2: S2{flag:true}
        };
    }
}