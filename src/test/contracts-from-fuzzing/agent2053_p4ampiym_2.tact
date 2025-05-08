struct NestedStruct {
    a: Int;
    b: Bool;
    name: String;
}

contract NestedFieldTest {
    details: NestedStruct;
    
    init() {
        self.details = NestedStruct{
            a: 123,
            b: true,
            name: "abc"
        };
    }
}