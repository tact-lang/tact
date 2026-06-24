struct NestedStruct {
    val_a: Int;
    val_b: String;
}

contract TestDeepOptional {
    myField: NestedStruct?;

    init() {
        self.myField = null;
    }
}