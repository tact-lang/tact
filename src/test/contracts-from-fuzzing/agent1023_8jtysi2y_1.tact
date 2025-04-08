struct NestedStruct { val1: Int; val2: Bool; val3: String }

contract TestContract {
    nested: NestedStruct;
    
    init() {
        self.nested = NestedStruct{
            val1: 123,
            val2: true,
            val3: "hello"
        };
    }
}
