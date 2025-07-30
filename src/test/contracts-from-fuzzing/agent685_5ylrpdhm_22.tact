struct BoolStruct {
    a: Bool;
    b: Bool;
    c: Bool;
}

contract ManyBools {
    flags: BoolStruct;

    init() {
        self.flags = BoolStruct{ a: true, b: false, c: true };
    }
}