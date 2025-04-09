struct Inner {
    a: Int;
    b: Int;
}

struct Outer {
    x: Inner;
    y: Inner;
}

contract MultiNested {
    data: Outer;

    init() {
        self.data = Outer{
            x: Inner{a: 1, b: 2},
            y: Inner{a: 3, b: 4}
        };
    }
}