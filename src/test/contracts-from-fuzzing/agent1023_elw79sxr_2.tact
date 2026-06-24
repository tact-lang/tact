struct DeepNested {
    level2: NestedStruct;
    value: Int;
}

struct NestedStruct {
    inner: SimpleStruct;
    flag: Bool;
}

struct SimpleStruct {
    x: Int;
    y: Int?; 
}

contract TestContract {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{
            level2: NestedStruct{
                inner: SimpleStruct{ x: 1, y: null },
                flag: true
            },
            value: 99
        };
    }
}