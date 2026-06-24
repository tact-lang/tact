struct BoolFields {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
}

contract ManyBools {
    flags: BoolFields;

    init() {
        self.flags = BoolFields{flag1: true, flag2: false, flag3: true};
    }
}