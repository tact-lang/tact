struct Inner {
    x: Int = 10;
    y: Bool?;
}

struct Outer {
    inner: Inner;
    label: String = "default";
}

contract NestedOptionalTest {
    data: Outer = Outer{
        inner: Inner{ x: 123 },
        label: "init"
    };

    init() {}
}