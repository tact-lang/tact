struct NestedStruct {
    a: Int;
    b: Bool;
}

contract DeepOptional {
    v: NestedStruct?;

    init() {
        self.v = null;
    }
}