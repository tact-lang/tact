struct SerializedInts {
    si8: Int as int8;
    su8: Int as uint8;
    si64: Int as int64;
    su64: Int as uint64;
}

contract TestContract {
    s: SerializedInts;

    init() {
        self.s = SerializedInts{si8:5, su8:6, si64:7, su64:8};
    }
}