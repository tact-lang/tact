struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    foo: Bool;
    bar: NestedInner;
}

struct NestedInner {
    baz: Int;
    qux: String;
}

contract PersistentNested {
    nestedData: DeeplyNested;

    init() {
        self.nestedData = DeeplyNested{
            inner: InnerStruct{
                foo: true,
                bar: NestedInner{
                    baz: 42,
                    qux: "nested"
                }
            }
        };
    }
}
