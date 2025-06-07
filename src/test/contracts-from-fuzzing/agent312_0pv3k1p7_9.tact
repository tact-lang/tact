contract MixedSerialization {
    intVal: Int as int64;
    uintVal: Int as uint32;
    coinsVal: Int as coins;
    boolVal: Bool;
    addrVal: Address;
    sliceVal: Slice;

    init() {
        self.intVal = -123456;
        self.uintVal = 123456;
        self.coinsVal = ton("1");
        self.boolVal = true;
        self.addrVal = myAddress();
        self.sliceVal = emptyCell().asSlice();
    }
}