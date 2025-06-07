struct NestedStruct {
    value: Int;
    flag: Bool;
}

contract NestedFieldTest {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{ value: 7, flag: true };
    }
}