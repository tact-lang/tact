struct S1 {
    a: Int;
    b: Int as uint32;
    c: Bool;
}

struct S2 {
    s1: S1;
    s1opt: S1?;
    s1opt2: S1?;
    txt: String;
}

contract OptNested {
    dat: S2;

    init() {
        self.dat = S2{
            s1: S1{a:1, b:2, c:true},
            s1opt: null,
            s1opt2: S1{a:9, b:8, c:false},
            txt: "hi"
        };
    }
}