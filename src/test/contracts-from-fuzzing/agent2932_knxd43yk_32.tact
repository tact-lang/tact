struct AOpt {
    val: Int?;
}

struct BOpt {
    val: Bool?;
}

struct COpt {
    val: String?;
}

contract OptionMix {
    a: AOpt;
    b: BOpt;
    c: COpt;

    init() {
        self.a = AOpt{ val: null };
        self.b = BOpt{ val: null };
        self.c = COpt{ val: null };
    }
}