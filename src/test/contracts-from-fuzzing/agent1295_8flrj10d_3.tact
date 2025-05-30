struct DeepInner {
    a: Int?;
    b: Bool?;
}

struct Outer {
    inner: DeepInner;
    c: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: DeepInner{ a: null, b: false },
            c: 7
        };
    }
}