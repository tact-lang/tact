struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    x: Int;
    y: Inner;
    z: String;
}

contract StorageTest {
    info: Outer;

    init() {
        self.info = Outer{
            x: 1,
            y: Inner{ a: 42, b: true },
            z: "Hello"
        };
    }
}