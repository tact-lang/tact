struct NestedStruct {
    val1: Int;
    val2: Int?;
    val3: Bool?;
    val4: String;
}

contract TestContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            val1: 1,
            val2: 2,
            val3: true,
            val4: "test"
        };
    }
}