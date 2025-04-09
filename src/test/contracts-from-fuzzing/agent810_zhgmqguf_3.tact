struct NestedStruct {
    level: Int;
    next: InnerStruct?;
}

struct InnerStruct {
    name: String;
    flag: Bool;
}

contract TestContract {
    nested: NestedStruct;
    init() {
        self.nested = NestedStruct {
            level: 1,
            next: InnerStruct{ name: "hi", flag: true },
        };
    }
}