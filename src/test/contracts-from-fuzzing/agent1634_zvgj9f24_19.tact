contract OptionalStructInOptional {
    s: InnerStruct?;

    init() {
        self.s = null;
    }
}

struct InnerStruct {
    x: Int;
    y: Int;
}