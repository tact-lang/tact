struct SLastOptional {
    x: Int;
    y: Int?;
}

contract LastOptionalField {
    s: SLastOptional;

    init() {
        self.s = SLastOptional{ x: 5, y: null };
    }
}
