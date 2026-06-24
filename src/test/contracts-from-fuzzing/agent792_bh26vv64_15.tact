struct MixedInts {
    a: Int as int64 = 0;
    b: Int as uint8 = 1;
    c: Int = 2;
}

contract TestContract {
    mi: MixedInts;

    init() {
        self.mi = MixedInts{};
    }
}