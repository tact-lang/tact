struct InnerLevel {
    x: Int;
    y: Int?;
}

struct NestedStruct {
    a: InnerLevel;
    b: InnerLevel?;
}

contract TestContract {
    param1: NestedStruct;

    init() {
        self.param1 = NestedStruct{
            a: InnerLevel{ x: 1, y: null },
            b: null
        };
    }
}