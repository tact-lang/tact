struct NestedStruct {
    x: Int;
    y: Int;
}

struct ContainsStruct {
    ns1: NestedStruct;
    ns2: NestedStruct;
    flag: Bool;
}

contract FuzzManyStructs {
    val: ContainsStruct;

    init() {
        self.val = ContainsStruct {
            ns1: NestedStruct { x: 1, y: 2 },
            ns2: NestedStruct { x: 3, y: 4 },
            flag: true
        };
    }
}
