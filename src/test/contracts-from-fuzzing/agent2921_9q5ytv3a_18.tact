struct S1 {
    f1: Int;
}

struct S2 {
    s1: S1;
    optionalStr: String?;
}

contract OptionalStringDeep {
    s2: S2;

    init() {
        self.s2 = S2{
            s1: S1{f1:4},
            optionalStr: "hello"
        };
    }
}
