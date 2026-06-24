struct Inner {
    a: Int;
}

struct Outer {
    x: Int;
    y: Inner;
    z: Bool?;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            x: 10,
            y: Inner{a: 5},
            z: null,
        };
    }
}