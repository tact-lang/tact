struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
    b: Int;
}

struct Wrapper {
    outer: Outer;
    c: Int;
}

contract ManyNestLevels {
    x: Wrapper;

    init() {
        self.x = Wrapper{
            outer: Outer{ inner: Inner{ a: 1 }, b: 2 },
            c:3
        };
    }
}