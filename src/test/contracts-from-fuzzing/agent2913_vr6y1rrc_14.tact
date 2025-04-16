struct SA {
    ai: Int;
    ab: Bool;
}

struct SB {
    bi: Int as uint32;
    ba: Address;
}

struct SC {
    ca: SA;
    cb: SB;
}

contract StructOfStructs {
    sc: SC;

    init() {
        self.sc = SC{
            ca: SA{ ai: 1, ab: false },
            cb: SB{ bi: 42, ba: myAddress() },
        };
    }
}