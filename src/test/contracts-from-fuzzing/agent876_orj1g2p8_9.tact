struct OptionalNested {
    inner: Int?;
}

struct WrapOpt {
    nested: OptionalNested?;
}

contract OptionalOfStructOptionalField {
    s: WrapOpt;

    init() {
        self.s = WrapOpt{ nested: null };
    }
}