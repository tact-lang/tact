struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    ist: Inner;
    z: String?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            ist: Inner{ x: 123, y: null },
            z: null
        };
    }
}