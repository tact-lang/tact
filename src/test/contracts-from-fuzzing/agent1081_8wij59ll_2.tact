struct DeepNested {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct Outer {
    inner: DeepNested;
    z: Int;
}

contract ComposeTest {
    st: Outer;

    init() {
        self.st = Outer{
            inner: DeepNested{ a: 10, b: null, c: true },
            z: 42
        };
    }
}