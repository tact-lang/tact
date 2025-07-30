struct Nested {
    x: Int;
    y: Bool?;
    z: String;
}

struct Outer {
    inner: Nested;
    flag: Bool;
}

contract DeepNest {
    param: Outer;
    init() {
        self.param = Outer{
            inner: Nested{
                x: 10,
                y: null,
                z: "hello"
            },
            flag: true
        };
    }
}