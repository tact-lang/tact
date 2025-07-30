struct Inner {
    f1: Int;
    f2: Bool?;
}

struct Mid {
    a: Inner;
    b: Inner;
    c: Inner;
}

contract NestedStructArrays {
    s1: Mid;
    s2: Mid;

    init() {
        self.s1 = Mid{
            a: Inner{f1:1,f2:null},
            b: Inner{f1:2,f2:null},
            c: Inner{f1:3,f2:null}
        };
        self.s2 = Mid{
            a: Inner{f1:4,f2:null},
            b: Inner{f1:5,f2:null},
            c: Inner{f1:6,f2:null}
        };
    }
}