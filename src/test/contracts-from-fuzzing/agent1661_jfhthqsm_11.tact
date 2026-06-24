struct Inner {
    x: Int = 1;
    y: Bool = false;
}

struct Outer {
    name: String;
    inner: Inner;
}

contract StructDefaults {
    data: Outer = Outer{
        name: "test",
        inner: Inner{}
    };
    init() {
        self.data = Outer{
            name: "ok",
            inner: Inner{ x: 5, y: true }
        };
    }
}