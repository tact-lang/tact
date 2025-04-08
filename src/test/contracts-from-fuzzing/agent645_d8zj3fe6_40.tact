struct OptionalNestedStruct {
    val: Int?;
}

contract Top {
    item: OptionalNestedStruct?;

    init() {
        self.item = null;
    }
}
