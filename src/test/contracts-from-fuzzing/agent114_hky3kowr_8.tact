struct Inner1 {
    f1: Int;
}

struct Inner2 {
    f2: Bool;
}

struct Outer {
    a: Inner1;
    b: Inner2;
    optInner1: Inner1?;
    optInner2: Inner2?;
}

contract ManyStructTypeVariants {
    outer: Outer;

    init() {
        self.outer = Outer{
            a: Inner1{f1: 1},
            b: Inner2{f2: false},
            optInner1: null,
            optInner2: null,
        };
    }
}