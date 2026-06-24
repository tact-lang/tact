struct C1 { a: Int; }
struct C2 { b: Int; }
struct C3 { c: Int; }
struct C4 { d: Int; }

struct BigNest {
    one: C1;
    two: C2;
    three: C3;
    four: C4;
}

contract ChainStructs {
    state: BigNest;

    init() {
        self.state = BigNest{
            one: C1{a:1},
            two: C2{b:2},
            three: C3{c:3},
            four: C4{d:4}
        };
    }
}
