contract OptionalNestedField {
    data: Data;

    init() {
        self.data = Data{
            nested: null
        };
    }
}

struct Data {
    nested: Inner?;
}

struct Inner {
    value: Int;
}