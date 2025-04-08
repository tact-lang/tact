struct OneField {
    value: Int;
}

contract MultiVars {
    f1: OneField;
    f2: OneField;
    f3: OneField;
    f4: OneField;

    init() {
        self.f1 = OneField{value:1};
        self.f2 = OneField{value:2};
        self.f3 = OneField{value:3};
        self.f4 = OneField{value:4};
    }
}