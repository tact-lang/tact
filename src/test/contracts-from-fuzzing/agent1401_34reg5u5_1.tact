struct NestedOne {
    intField: Int;
    optBool: Bool?;
}

struct NestedTwo {
    strField: String;
    optNested: NestedOne?;
}

contract DeepNestedTest {
    complexField: NestedTwo;
    
    init() {
        self.complexField = NestedTwo{
            strField: "hello",
            optNested: NestedOne{ intField: 1, optBool: true },
        };
    }
}