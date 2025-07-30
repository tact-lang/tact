struct Inner {
    a: Int?;
    b: String?;
}

struct Outer {
    x: Int;
    y: Inner;
    z: Bool?;
}

contract Test {
    storage: Outer;

    init() {
        self.storage = Outer{
            x: 42,
            y: Inner{
                a: 1,
                b: "hello"
            },
            z: true
        };
    }
}