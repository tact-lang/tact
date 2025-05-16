contract OptionalOfOptionalStruct {
    nested: RecOpt?;

    init() {
        self.nested = null;
    }
}

struct RecOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}