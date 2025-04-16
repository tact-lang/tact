struct DeepInner {
    foo: Int;
    bar: Bool?;
}

struct Middle {
    nested: DeepInner;
}

struct Outer {
    wrap: Middle;
}

contract DeepTest {
    field: Outer;
    init() {
        self.field = Outer{
            wrap: Middle{
                nested: DeepInner{
                    foo: 5,
                    bar: null,
                },
            },
        };
    }
}