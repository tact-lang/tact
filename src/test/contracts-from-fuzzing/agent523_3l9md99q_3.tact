struct DeepNested {
    n1: Int;
    n2: Bool;
    n3: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract DeepNestedContract {
    d: DeepNested;
    init() {
        self.d = DeepNested{
            n1: 1,
            n2: false,
            n3: InnerStruct{x: 2, y: true}
        };
    }
}