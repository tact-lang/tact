struct S {
    a: Int;
}

struct Outer {
    x: S;
    y: S;
}

contract SameStructTwice {
    data: Outer;

    init() {
        self.data = Outer{
            x: S{a: 1},
            y: S{a: 2}
        };
    }
}