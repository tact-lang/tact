struct FinalOptStr {
    a: String?;
}

contract NullFinalOptStr {
    x: FinalOptStr;
    init() {
        self.x = FinalOptStr{a: null};
    }
}