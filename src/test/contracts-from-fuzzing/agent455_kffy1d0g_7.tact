struct SubStruct {
    val: Int;
    flag: Bool;
}

contract OptionalNestedStruct {
    stored: SubStruct?;

    init() {
        self.stored = null;
    }
}