struct Inner {
    foo: Int;
    bar: Bool;
}

struct Outer {
    nested: Inner;
    text: String;
}

contract NestedMultiType {
    data: Outer;
    
    init() {
        self.data = Outer{
            nested: Inner{ foo: 123, bar: true },
            text: "abc"
        };
    }
}
