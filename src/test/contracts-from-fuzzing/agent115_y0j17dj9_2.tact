struct Inner {
    x: Int;
    y: String;
    z: Bool;
}

struct Outer {
    nested: Inner;
    flag: Bool;
    description: String;
}

contract NestedStructContract {
    value: Outer;

    init() {
        self.value = Outer{
            nested: Inner{ x: 10, y: "hello", z: true },
            flag: false,
            description: "outer"
        };
    }
}