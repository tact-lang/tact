struct DeepNested {
    foo: Int;
    nested: InnerStruct;
}

struct InnerStruct {
    bar: Bool;
    maybeInt: Int?;
}

contract DeepNestedStructContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            foo: 5,
            nested: InnerStruct{bar: true, maybeInt: null}
        };
    }
}