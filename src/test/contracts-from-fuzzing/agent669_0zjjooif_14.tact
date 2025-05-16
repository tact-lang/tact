struct DeeplyOptional {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeStr: String?;
}

contract OptionalCombo {
    val: DeeplyOptional;

    init() {
        self.val = DeeplyOptional{
            maybeInt: null,
            maybeBool: null,
            maybeStr: null
        };
    }
}