struct Inner {
    foo: Int;
    bar: String;
}

struct Middle {
    innerOpt: Inner?;
    x: Bool;
}

struct Outer {
    middle: Middle;
    name: String;
}

contract NestedOptionStructs {
    store: Outer;

    init() {
        self.store = Outer{
            middle: Middle{
                innerOpt: null,
                x: true
            },
            name: "test"
        };
    }
}
