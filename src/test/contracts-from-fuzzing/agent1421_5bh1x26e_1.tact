struct NestedStruct {
    a: Int;
    b: String;
}

contract DeepOptionalContract {
    data: NestedStruct?;

    init() {
        self.data = null;
    }
}