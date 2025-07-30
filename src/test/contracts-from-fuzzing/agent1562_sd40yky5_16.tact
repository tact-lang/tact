struct SerialOrder {
    int8: Int as int8;
    uint64: Int as uint64;
    int256: Int;
    flag: Bool;
    optStr: String?;
}

contract TestContract {
    so: SerialOrder;
    init() {
        self.so = SerialOrder{
            int8: 100,
            uint64: 1000000,
            int256: -1,
            flag: true,
            optStr: null,
        };
    }
}