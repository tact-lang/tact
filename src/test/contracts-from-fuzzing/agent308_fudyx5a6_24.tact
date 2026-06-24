struct StringsAndBools {
    s: String;
    b: Bool;
}

contract StringBoolPersist {
    mixed: StringsAndBools;

    init() {
        self.mixed = StringsAndBools{
            s:"foo",
            b:false,
        };
    }
}
