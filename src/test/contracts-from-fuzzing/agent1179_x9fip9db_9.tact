struct S1 {
    v1: Int;
    v2: Bool;
}

struct S2 {
    s1: S1;
    s2: S1;
    optionalInt: Int?;
}

contract TestContract {
    s2: S2;

    init() {
        self.s2 = S2{
            s1: S1{v1:1,v2:true},
            s2: S1{v1:2,v2:false},
            optionalInt: null
        };
    }

    receive() {}
}