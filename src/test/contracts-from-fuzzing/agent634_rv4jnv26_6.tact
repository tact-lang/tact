struct SerializeSpec {
    int4: Int as int4;
    uint7: Int as uint7;
    coinVal: Int as coins;
}

contract SerializeSpecContract {
    ser: SerializeSpec;

    init() {
        self.ser = SerializeSpec{int4: -5, uint7: 100, coinVal: 1000000000};
    }
}