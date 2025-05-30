struct Inner {
    x: Int?;
    y: Bool;
}

struct Outer {
    foo: Inner;
    bar: String?;
}

contract Test {
    s: Outer;
    init() {
        self.s = Outer{
            foo: Inner{
                x: null,
                y: false
            },
            bar: "optional string"
        };
    }
}
