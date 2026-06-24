struct OuterMost {
    inner1: Inner1;
    inner2: Inner2;
}

struct Inner1 {
    x: Int;
    next: Inner1b;
}

struct Inner1b {
    y: Int?;
}

struct Inner2 {
    z: Bool;
}

contract LayerCake {
    data: OuterMost;
    init() {
        self.data = OuterMost{
            inner1: Inner1{ x: 1, next: Inner1b{ y: null } },
            inner2: Inner2{ z: true }
        };
    }
}