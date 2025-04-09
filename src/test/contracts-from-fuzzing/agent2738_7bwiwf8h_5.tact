struct NestedWithOptional {
    val: Int;
    text: String?;
    flag: Bool;
}

contract DeepOptional {
    nested: NestedWithOptional?;

    init() {
        self.nested = null;
    }
}
