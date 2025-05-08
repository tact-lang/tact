struct BigNested {
    a: Int;
    b: Sub1;
    c: Sub2;
}

struct Sub1 {
    d: Int;
    e: Sub3;
}

struct Sub2 {
    f: Bool;
    g: Sub3?;
}

struct Sub3 {
    h: String;
    i: Address?;
}

contract Test {
    store: BigNested;

    init() {
        self.store = BigNested{
            a: 1,
            b: Sub1{d:2, e:Sub3{h:"hi", i:null}},
            c: Sub2{f:true, g:null},
        };
    }
}