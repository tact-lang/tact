struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{ inner: InnerStruct{ value: 42 } };
    }
}