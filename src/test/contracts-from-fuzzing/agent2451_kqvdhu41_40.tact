struct NestedStr {
    x: String;
    y: String?;
}

contract OptionalStrStruct {
    val: NestedStr?;

    init() {
        self.val = null;
    }
}