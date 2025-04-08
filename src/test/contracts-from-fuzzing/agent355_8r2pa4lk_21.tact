struct SingleBool {
    flag: Bool;
}

struct SingleInt {
    num: Int;
}

contract DiffStructFields {
    sb: SingleBool;
    si: SingleInt;

    init() {
        self.sb = SingleBool{ flag: true };
        self.si = SingleInt{ num: 7 };
    }
}