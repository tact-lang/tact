struct S1 {
    a:Int;
    b:Int?;
}

struct S2 {
    s:S1?;
}

contract NestedOptDefaults {
    d:S2;

    init() {
        self.d = S2{s:null};
    }
}