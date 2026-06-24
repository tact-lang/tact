struct SerOptions {
    big: Int as int64;
    sm: Int as uint4;
}

contract ComplexFormats {
    nested: SerOptions;
    optNested: SerOptions?;

    init() {
        self.nested = SerOptions{ big: 1000, sm: 7 };
        self.optNested = null;
    }
}