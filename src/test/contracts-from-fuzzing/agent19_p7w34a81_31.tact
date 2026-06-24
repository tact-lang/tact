struct BoolIntMix {
    flag: Bool;
    num: Int;
}

struct IntBoolMix {
    num: Int;
    flag: Bool;
}

contract CrossOrderFields {
    first: BoolIntMix;
    second: IntBoolMix;

    init() {
        self.first = BoolIntMix{ flag: true, num: 100 };
        self.second = IntBoolMix{ num: 200, flag: false };
    }
}