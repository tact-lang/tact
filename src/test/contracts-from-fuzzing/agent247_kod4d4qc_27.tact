struct Inner {
    id: Int;
}

struct Outer {
    a: Inner;
    b: Inner;
    c: Inner;
    d: Inner;
}

contract ArrayLike {
    data: Outer;
    init() {
        self.data = Outer{
            a: Inner{id:1},
            b: Inner{id:2},
            c: Inner{id:3},
            d: Inner{id:4}
        };
    }
}