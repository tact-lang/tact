contract OptionalStructConflict {
    a: Int?;
    init() {
        self.a = null;
    }
}

struct OptionalStruct {
    b: Int?;
}