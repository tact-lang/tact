struct Tiny1 { f: Int; }
struct Tiny2 { f: Int; }
struct Tiny3 { f: Int; }

contract ManyTiny {
    t1: Tiny1;
    t2: Tiny2;
    t3: Tiny3;

    init() {
        self.t1 = Tiny1{f:1};
        self.t2 = Tiny2{f:2};
        self.t3 = Tiny3{f:3};
    }
}