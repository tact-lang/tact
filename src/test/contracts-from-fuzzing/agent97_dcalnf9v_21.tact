struct AOpt {
    x: Int?;
}

struct BOpt {
    y: AOpt?;
}

contract DoubleOptionals {
    field: BOpt;
    init() {
        self.field = BOpt{ y: null };
    }
}