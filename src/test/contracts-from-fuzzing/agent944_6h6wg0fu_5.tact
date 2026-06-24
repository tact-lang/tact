struct Nester {
    a: Int;
    b: Inner1;
    c: Int;
}

struct Inner1 {
    d: Int;
    e: Inner2;
}

struct Inner2 {
    f: Int;
    g: Inner3;
}

struct Inner3 {
    h: Int;
    i: Bool;
}

contract DeepNest {
    s: Nester;

    init() {
        self.s = Nester{
            a:1, c:3,
            b: Inner1{
                d:4,
                e: Inner2{
                    f:6,
                    g: Inner3{ h:8, i:true }
                }
            }
        };
    }
}