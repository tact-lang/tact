struct Inner {
    x: Int = 10;
    y: Bool? = null;
}

struct Outer {
    inner: Inner;
    z: String = "ok";
    w: Int? = null;
}

contract DeepNested {
    field: Outer = Outer{
        inner: Inner{x: 20, y: true},
        z: "hello",
        w: 1,
    };
    init() {
        self.field = self.field;
    }
}