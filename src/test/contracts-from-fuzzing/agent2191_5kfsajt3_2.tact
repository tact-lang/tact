struct Nested {
    inner: Int;
    flag: Bool;
    text: String;
}

struct Outer {
    nested: Nested;
    count: Int;
    enable: Bool;
}

contract ComplexStorage {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Nested{inner: 555, flag: false, text: "hello"},
            count: 123,
            enable: true,
        };
    }
}
