struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    x: Int;
    y: Inner;
    z: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            x: 1,
            y: Inner{a: 2, b: true},
            z: false,
        };
    }
}