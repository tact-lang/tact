struct OneField {
    a: Int;
}

contract OneFieldStruct {
    s: OneField;

    init() {
        self.s = OneField{a: 7};
    }
}