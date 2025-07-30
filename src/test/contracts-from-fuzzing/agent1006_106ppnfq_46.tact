struct OneField {
    x: Int;
}

contract OneFieldStruct {
    f: OneField;

    init() {
        self.f = OneField{ x: 99 };
    }
}