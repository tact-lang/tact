struct OptionalStruct {
    inner: Int?;
}

contract OptionalFieldInitialization {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{ inner: null };
    }
}
