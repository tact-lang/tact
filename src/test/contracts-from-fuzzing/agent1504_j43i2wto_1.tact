struct NestedStruct {
    inner1: Int;
    inner2: Bool;
}

contract DeeplyNested {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            inner1: 1,
            inner2: true,
        };
    }
}