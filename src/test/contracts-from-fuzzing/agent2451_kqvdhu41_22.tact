struct InnerStruct {
    a: Int;
    b: Bool;
}

struct OuterStruct {
    inner: InnerStruct;
    optionalInt: Int?;
    text: String;
}

contract ComplexStorage {
    store: OuterStruct;

    init() {
        self.store = OuterStruct{
            inner: InnerStruct{ a: 5, b: true },
            optionalInt: null,
            text: "test"
        };
    }
}