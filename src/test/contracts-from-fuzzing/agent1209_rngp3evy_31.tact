struct Inner1 {
    v: Int;
}

struct Inner2 {
    b: Bool;
}

struct Middle1 {
    child: Inner1;
}

struct Middle2 {
    child: Inner2;
}

struct Outer {
    m1: Middle1;
    m2: Middle2;
}

contract MixedNest {
    data: Outer;
    init() {
        self.data = Outer{
            m1: Middle1{child: Inner1{v: 5}},
            m2: Middle2{child: Inner2{b: true}}
        };
    }
}