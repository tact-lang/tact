struct Inner {
    a: Int?;
    b: Bool;
}

struct Outer {
    x: Inner?;
    y: String?;
    z: Bool;
}

contract TestContract {
    s: Outer;
    init() {
        self.s = Outer{
            x: Inner{ a: null, b: true },
            y: null,
            z: false
        };
    }
}