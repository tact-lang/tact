struct DeepNested {
    inner: Nested;
    flag: Bool;
}

struct Nested {
    a: Int;
    b: Int?;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: Nested{ a: 5, b: null },
            flag: true
        };
    }
}