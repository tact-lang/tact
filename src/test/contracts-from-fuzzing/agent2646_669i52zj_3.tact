struct DeepNested {
    level1: Int;
    optionalStruct: NestedStruct?;
}

struct NestedStruct {
    foo: Int;
    bar: Bool;
}

contract DeepNestedContract {
    d: DeepNested;
    init() {
        self.d = DeepNested{
            level1: 42,
            optionalStruct: NestedStruct{foo: 99, bar: false}
        };
    }
    receive() {}
}