struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    x: Int;
    y: Bool;
    z: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            x: 1,
            y: true,
            z: Inner{a: 5, b: false},
        };
    }
}
