struct NestedStruct {
    flag: Bool;
    amount: Int;
}

contract DeepOptionals {
    data: NestedStruct?;

    init() {
        self.data = null;
    }
}