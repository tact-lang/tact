struct MixedSerialized {
    int257: Int as int257;
    int64: Int as int64;
    uint64: Int as uint64;
    coins: Int as coins;
    flag: Bool;
    text: String;
    addr: Address;
    dataCell: Cell;
    dataSlice: Slice;
}

contract MixedSerializationTest {
    s: MixedSerialized;

    init() {
        self.s = MixedSerialized{
            int257: -123,
            int64: 64,
            uint64: 64,
            coins: 1000000000,
            flag: true,
            text: "hi",
            addr: myAddress(),
            dataCell: emptyCell(),
            dataSlice: emptyCell().asSlice()
        };
    }
}