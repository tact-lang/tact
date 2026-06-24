struct NestedStruct {
    val1: Int;
    flag: Bool;
}

contract TestContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            val1: 42,
            flag: true
        };
    }
}
