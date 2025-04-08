struct Nested {
    field1: Int;
    innerStruct: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    persistentField: Nested;

    init() {
        self.persistentField = Nested{
            field1: 42,
            innerStruct: Inner{a: 5, b: false},
        };
    }
}