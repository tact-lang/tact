struct Bottom {
    val: Int;
}

struct Middle {
    vat: Bottom;
}

struct Top {
    vbt: Middle;
    flag: Bool?;
}

contract DeepChain {
    payload: Top;

    init() {
        self.payload = Top{ vbt: Middle{ vat: Bottom{ val: 123 } }, flag: null };
    }
}