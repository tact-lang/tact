struct MixedTypes {
    num: Int as int64;
    flag: Bool;
    text: String;
    data: Cell;
    addr: Address;
    bits: Slice;
    builder: Builder;
}

contract MixedFields {
    storage: MixedTypes;

    init() {
        self.storage = MixedTypes{
            num: 42,
            flag: true,
            text: "hello",
            data: emptyCell(),
            addr: myAddress(),
            bits: emptyCell().asSlice(),
            builder: beginCell()
        };
    }
}
