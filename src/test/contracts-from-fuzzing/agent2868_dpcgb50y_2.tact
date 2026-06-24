struct NestedStruct {
    a: Int;
    b: Bool;
    optionalC: Int?;
}

contract NestedStructStorage {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{ a:1, b:true };
    }
}