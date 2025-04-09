struct Inner {
    n: Int;
    s: String;
}

struct Outer {
    x: Bool;
    y: Inner;
    z: Int?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            x: true,
            y: Inner{ n: 42, s: "test" },
            z: null,
        };
    }
}
