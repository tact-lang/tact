struct Inner1 {
    a: Int;
}
struct Inner2 {
    b: Int;
}
struct Middle {
    i1: Inner1;
    i2: Inner2;
}

struct Top {
    m: Middle;
    c: String;
}

contract MultiStruct {
    s: Top;
    init() {
        self.s = Top{
            m: Middle{
                i1: Inner1{a:1},
                i2: Inner2{b:2}
            },
            c: "ok"
        };
    }
}