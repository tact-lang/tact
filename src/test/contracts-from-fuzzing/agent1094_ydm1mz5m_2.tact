struct DeepNested {
    d: Int;
}

struct Nested {
    c: DeepNested;
}

struct Outer {
    a: Int;
    b: Nested;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            a: 1,
            b: Nested{
                c: DeepNested{d: 42}
            }
        };
    }
}