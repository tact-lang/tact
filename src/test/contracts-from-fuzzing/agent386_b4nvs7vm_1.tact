struct Nested {
    level1: Int;
    optLevel2: Int?;
}

contract DeepOptional {
    nested: Nested?;
    flag: Bool;

    init() {
        self.nested = null;
        self.flag = true;
    }
}