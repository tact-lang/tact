struct NestedStruct {
    inner: Int;
}

struct OuterStruct {
    nested: NestedStruct;
    flag: Bool;
}

contract NestedContract {
    data: OuterStruct = OuterStruct{nested: NestedStruct{inner: 1}, flag: true};
    
    init() {
        self.data = OuterStruct{nested: NestedStruct{inner: 2}, flag: false};
    }
}