struct DeepOptional {
    a: Int?;
    b: Int?;
    c: Int?;
}

struct NestedStruct {
    d: Bool;
    e: DeepOptional;
}

contract TestContract {
    data: NestedStruct;
    init() {
        self.data = NestedStruct{ d: true, e: DeepOptional{ a: null, b: null, c: null } };
    }
}
