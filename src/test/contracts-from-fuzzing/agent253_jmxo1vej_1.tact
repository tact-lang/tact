struct NestedStruct {
    val1: Int;
    val2: Bool;
    val3: String;
}

contract TestContract {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{
            val1: 1,
            val2: true,
            val3: "test"
        };
    }
}