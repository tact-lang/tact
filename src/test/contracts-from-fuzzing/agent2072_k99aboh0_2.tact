struct Nested {
    a: Int;
    b: Bool;
}

struct Outer {
    n: Nested;
    s: String;
}

contract StorageNested {
    value: Outer;

    init() {
        self.value = Outer{
            n: Nested{ a: 42, b: true },
            s: "hello"
        };
    }
}