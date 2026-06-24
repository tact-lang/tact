struct PackedWithRemain {
    counter: Int as uint8;
    balance: Int as coins;
    remnant: Slice as remaining;
}

contract PackedRemainStorage {
    data: PackedWithRemain;

    init() {
        self.data = PackedWithRemain{
            counter: 2,
            balance: ton("1"),
            remnant: emptyCell().asSlice(),
        };
    }
}
