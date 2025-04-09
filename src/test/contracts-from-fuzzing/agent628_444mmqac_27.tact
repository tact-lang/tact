struct BoolOptional {
    v: Bool?;
}

contract OptionalBoolField {
    test: BoolOptional;

    init() {
        self.test = BoolOptional{v:null};
    }
}