struct NestedOpt {
    a: Int?;
    b: Bool?;
}

struct S {
    x: NestedOpt;
    y: Int;
}

contract OptionalInStruct {
    s: S;

    init() {
        self.s = S{
            x: NestedOpt{ a:null, b:null },
            y: 5
        };
    }
}