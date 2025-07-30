struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int;
}

contract Test {
    nestedData: Nested;

    init() {
        self.nestedData = Nested{inner: InnerStruct{value: 42}};
    }
}