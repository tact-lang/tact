struct NestedOptional {
    s: String?;
    num: Int?;
    flag: Bool?;
}

contract OptionalStruct {
    opt: NestedOptional?;

    init() {
        self.opt = null;
    }
}