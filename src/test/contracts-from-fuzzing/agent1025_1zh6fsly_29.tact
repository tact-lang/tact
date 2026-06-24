const VAL: Int = 7;

struct ConstUse {
    x: Int = VAL;
    y: Int;
}

contract WithConstField {
    c: ConstUse;

    init() {
        self.c = ConstUse{ x: VAL, y: 10 };
    }
}
