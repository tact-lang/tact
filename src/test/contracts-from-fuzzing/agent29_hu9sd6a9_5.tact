struct Tiny1 { a: Int }
struct Tiny2 { b: Bool }
struct Tiny3 { c: Bool? }
struct Tiny4 { d: String }

struct BigNest {
    t1: Tiny1;
    t2: Tiny2;
    t3: Tiny3;
    t4: Tiny4;
}

contract MixTiny {
    data: BigNest;
    init() {
        self.data = BigNest{
            t1: Tiny1{a:1},
            t2: Tiny2{b:true},
            t3: Tiny3{c:null},
            t4: Tiny4{d:"hello"},
        };
    }
}