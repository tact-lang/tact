struct S1 {
    f: Int;
}

struct S2 {
    f: Int;
    s1: S1;
}

contract StructRepeatField {
    s1: S1;
    s2: S2;

    init() {
        self.s1 = S1{f:1};
        self.s2 = S2{f:2,s1:S1{f:3}};
    }
}