struct HasBoolOpt {
    a: Bool?;
    b: Bool;
}

contract BoolOptionalCombo {
    x: HasBoolOpt;

    init() {
        self.x = HasBoolOpt{ a: null, b: true };
    }
}