struct Inner {
    x: Int;
    y: Bool?;
    z: String;
}

struct Outer {
    foo: Inner;
    bar: Int?;
    baz: Bool;
}

contract NestedOptionalsContract {
    data: Outer;
    
    init() {
        self.data = Outer{
            foo: Inner{
                x: 42,
                y: null,
                z: "deep"
            },
            bar: null,
            baz: true
        };
    }
}