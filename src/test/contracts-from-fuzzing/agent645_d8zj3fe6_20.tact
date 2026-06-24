struct S {
    flag: Bool;
    text: String?;
    num: Int?;
}

contract DeeplyOptional {
    nested: S?;

    init() {
        self.nested = null;
    }
}
