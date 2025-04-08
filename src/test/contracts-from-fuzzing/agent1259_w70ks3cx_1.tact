struct NestedOptional {
    x: Int?;
    y: Bool?;
}

contract DeepOptionals {
    val: Int?;
    flag: Bool?;
    nested: NestedOptional?;

    init() {
        self.val = null;
        self.flag = true;
        self.nested = null;
    }
}