struct Inner1 { x: Int; }
struct Inner2 { y: Int; }

struct Outer {
    i1: Inner1;
    i2: Inner2;
    opt_s: String?;
}

contract MixedNested {
    data: Outer;

    init() {
        self.data = Outer{
            i1: Inner1{x:1},
            i2: Inner2{y:2},
            opt_s: null
        };
    }
}