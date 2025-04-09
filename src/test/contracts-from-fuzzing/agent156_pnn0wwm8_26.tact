struct EmbeddedStruct {
    val: Int;
    valOpt: Int?;
}

contract OptionalStructField {
    f: EmbeddedStruct?;

    init() {
        self.f = EmbeddedStruct{ val: 5, valOpt: null };
    }
}
