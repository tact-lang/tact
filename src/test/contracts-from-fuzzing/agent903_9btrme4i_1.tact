struct Nested {
    x: Int;
    y: Bool;
    z: String;
}

struct Outer {
    foo: Int;
    bar: Nested;
    baz: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            foo: 1,
            bar: Nested{x: 2, y: false, z: "test"},
            baz: true
        };
    }
}