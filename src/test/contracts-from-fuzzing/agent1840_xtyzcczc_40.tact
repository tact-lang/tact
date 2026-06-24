struct Tiny {
    a: Int as uint1;
    b: Int as uint1;
    c: Int as uint1;
    d: Int as uint1;
    e: Int as uint1;
}

contract TinyContract {
    f: Tiny;
    init() {
        self.f = Tiny{ a:1,b:1,c:1,d:1,e:1 };
    }
}