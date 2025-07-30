struct SDefaultedOptional {
    x: Int? = null;
}

contract OptionalDefaultStructField {
    s: SDefaultedOptional;

    init() {
        self.s = SDefaultedOptional{};
    }
}