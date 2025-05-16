struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int;
}

contract ComplexNested {
    storage: Nested;
    init() {
        self.storage = Nested{inner: InnerStruct{value: 42}};
    }
}