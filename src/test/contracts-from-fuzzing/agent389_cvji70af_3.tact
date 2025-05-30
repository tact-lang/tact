struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    foo: Int;
    bar: Inner;
    opt: Inner?;
    s: String;
}

contract DeepNest {
    data: Outer;

    init() {
        self.data = Outer{
            foo: 42,
            bar: Inner{ x:1, y:true },
            opt: null,
            s: "hi",
        };
    }
}