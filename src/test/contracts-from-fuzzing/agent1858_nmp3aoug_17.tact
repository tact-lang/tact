struct S {
    a: Int;
    b: Int;
    c: Int;
}

contract NestedSameStruct {
    s1: S;
    s2: S;
    init() {
        self.s1 = S{ a:1,b:2,c:3 };
        self.s2 = S{ a:4,b:5,c:6 };
    }
}