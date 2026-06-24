struct NestedStruct {
    amount: Int;
    flag: Bool;
    text: String;
}

contract TestContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            amount: 10,
            flag: true,
            text: "Hello"
        };
    }
}