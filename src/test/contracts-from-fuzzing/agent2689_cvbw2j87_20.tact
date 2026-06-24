struct Outer {
    a: Int;
    b: Inner;
}

struct Inner {
    c: Int;
    d: Leaf;
}

struct Leaf {
    e: Int;
}

contract MultiLevel {
    s: Outer;

    init() {
        self.s = Outer{
            a: 10,
            b: Inner{
                c: 20,
                d: Leaf{
                    e: 30,
                },
            },
        };
    }
}