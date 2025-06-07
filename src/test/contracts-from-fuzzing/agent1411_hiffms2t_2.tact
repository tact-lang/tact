struct InnerNested {
    innerX: Int;
    innerY: Bool;
}

struct NestedStruct {
    nestedA: Int;
    nestedB: String;
    nestedC: InnerNested;
    nestedD: Bool?;
}

contract TestContract {
    data: NestedStruct;
    init() {
        self.data = NestedStruct{
            nestedA: 10,
            nestedB: "Hello",
            nestedC: InnerNested{innerX: 100, innerY: false},
            nestedD: null,
        };
    }
}