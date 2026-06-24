struct NestedStruct {
    innerVal: Int;
    innerText: String;
}

contract DeepNestTest {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            innerVal: 10,
            innerText: "Hello"
        };
    }
}