struct NestedOpt {
    inn: Int?;
    flag: Bool;
}

contract OptionalNestedField {
    opt: NestedOpt?;
    init() {
        self.opt = null;
    }
}