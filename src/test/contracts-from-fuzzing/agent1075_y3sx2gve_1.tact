struct NestedDeep {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int;
}

contract DeepNestedContract {
    nested: NestedDeep;

    init() {
        self.nested = NestedDeep{
            inner: InnerStruct{ value: 42 }
        };
    }
}
