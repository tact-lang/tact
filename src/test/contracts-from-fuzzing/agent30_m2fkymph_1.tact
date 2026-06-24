struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    value: Int;
}

contract ComplexState {
    data: Nested;

    init() {
        self.data = Nested{
            inner: InnerStruct{flag: true, value: 42}
        };
    }
}