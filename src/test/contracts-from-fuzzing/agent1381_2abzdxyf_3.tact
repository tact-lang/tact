struct Outer {
    s1: Int;
    s2: Inner;
}

struct Inner {
    x: Int;
    y: Bool;
    z: Int?;
}

contract TestContract {
    st: Outer;

    init() {
        self.st = Outer{
            s1: 5,
            s2: Inner{ x: 10, y: true, z: null }
        };
    }
}