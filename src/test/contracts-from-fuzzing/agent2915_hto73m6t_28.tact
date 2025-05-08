struct DeepComplex {
    intTiny: Int as uint8 = 7;
    bigStr: String = "μøç";
    maybeBool: Bool? = null;
    coinsVal: Int as coins = 42;
}

contract TestContract {
    deep: DeepComplex;

    init() {
        self.deep = DeepComplex{};
    }
}
