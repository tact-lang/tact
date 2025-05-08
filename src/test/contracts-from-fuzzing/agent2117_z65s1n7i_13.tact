struct SBool {
    a: Bool;
    b: Bool?;
}

contract BoolOptContract {
    storage: SBool;
    init() {
        self.storage = SBool{ a: true, b: null };
    }
}