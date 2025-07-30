struct FinalOptBool {
    a: Bool?;
}

contract NullFinalOptBool {
    x: FinalOptBool;
    init() {
        self.x = FinalOptBool{a: null};
    }
}