struct Tiny1 {
    a: Int as int1;
}

struct Tiny2 {
    b: Int as int2;
}

struct Tiny3 {
    c: Int as int3;
}

contract ManyTinyInts {
    t1: Tiny1;
    t2: Tiny2;
    t3: Tiny3;

    init() {
        self.t1 = Tiny1{a:0};
        self.t2 = Tiny2{b:1};
        self.t3 = Tiny3{c:-1};
    }
}
