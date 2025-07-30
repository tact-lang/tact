struct Inner1 {
    a: Int;
}

struct Middle1 {
    b: Inner1;
}

struct Inner2 {
    c: Bool;
}

struct Middle2 {
    d: Inner2;
}

struct Outer {
    m1: Middle1;
    m2: Middle2;
}

contract TwoChains {
    nested: Outer;

    init() {
        self.nested = Outer {
            m1: Middle1{b:Inner1{a:1}},
            m2: Middle2{d:Inner2{c:true}}
        };
    }
}