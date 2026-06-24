struct Tiny2 {
    a: Int;
}

struct Small2 {
    t1: Tiny2;
    t2: Tiny2;
}

contract SmallStructs {
    s: Small2;

    init() {
        self.s = Small2{
            t1: Tiny2{a:1},
            t2: Tiny2{a:2}
        };
    }
}