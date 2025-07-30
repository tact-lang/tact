struct InnerMost {
    flag: Bool;
    comment: String;
}

struct Middle {
    im: InnerMost;
    test: Int;
}

struct OuterMost {
    mid: Middle;
    title: String;
    valid: Bool;
}

contract DeepNestedStruct {
    d: OuterMost;
    init() {
        self.d = OuterMost{
            mid: Middle{im:InnerMost{flag:true,comment:"h"},test:42},
            title: "Hi",
            valid:true
        };
    }
}
