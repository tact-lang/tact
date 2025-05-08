contract OptionalOfStruct {
    s: OptionalStruct?;

    init() {
        self.s = OptionalStruct{ a: 10 };
    }
}

struct OptionalStruct {
    a: Int;
}