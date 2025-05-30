struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    foo: Inner?;
    bar: String;
    baz: Int?;
}

contract ComboNulls {
    state: Outer;

    init() {
        self.state = Outer{
            foo: null,
            bar: "ok",
            baz: null,
        };
    }
}
