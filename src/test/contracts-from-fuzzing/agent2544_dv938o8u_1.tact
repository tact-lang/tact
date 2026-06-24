struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: Nested;
    init() {
        self.data = Nested{ inner: InnerStruct{ a: 1, b: true } };
    }
}