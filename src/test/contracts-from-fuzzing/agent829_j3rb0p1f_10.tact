struct Inner1 {
    a: Int;
}
struct Inner2 {
    b: Bool;
}

struct Outer {
    inner1: Inner1;
    inner2: Inner2;
    n: Int?;
}

contract NestedComb {
    s: Outer;
    init() {
        self.s = Outer{
            inner1: Inner1{ a: 5 },
            inner2: Inner2{ b: false },
            n: null,
        };
    }
}