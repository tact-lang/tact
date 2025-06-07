struct S1 {
    a: Int;
    b: Int;
}

struct S2 {
    s1a: S1;
    s1b: S1;
}

contract TestRepeatStructs {
    val: S2;
    init() {
        self.val = S2{
            s1a: S1{a:1,b:2},
            s1b: S1{a:3,b:4},
        };
    }
}