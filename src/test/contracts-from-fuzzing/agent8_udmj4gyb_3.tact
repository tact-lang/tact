struct DeepInner {
    x: Int;
    y: Bool;
}

struct Middle {
    foo: DeepInner?;
    bar: Bool;
}

contract TestContract {
    nested: Middle;

    init() {
        self.nested = Middle{
            foo: DeepInner{
                x: 1,
                y: false,
            },
            bar: true,
        };
    }
}
