struct DeeplyNested {
    foo: Int;
    optNested: NestedStruct?;
}

struct NestedStruct {
    bar: Int;
    optionalBar: Int?;
}

contract TestContract {
    deep: DeeplyNested;

    init() {
        self.deep = DeeplyNested{
            foo: 10,
            optNested: NestedStruct{bar: 1, optionalBar: null}
        };
    }
}