struct Inner {
    foo: Int;
    bar: Bool;
}

struct Outer {
    nested: Inner?;
    label: String;
    count: Int;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{foo: 10, bar: true},
            label: "test",
            count: 7
        };
    }
}