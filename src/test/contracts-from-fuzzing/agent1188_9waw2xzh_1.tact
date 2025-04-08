struct InnerStruct {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    nested: InnerStruct;

    init() {
        self.nested = InnerStruct{val1: 1, val2: true};
    }
}