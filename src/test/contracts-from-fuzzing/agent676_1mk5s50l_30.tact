struct OptionalVar {
    f: String?;
}

contract OptionalVarContract {
    storage: OptionalVar;

    init() {
        self.storage = OptionalVar { f: null };
    }
}