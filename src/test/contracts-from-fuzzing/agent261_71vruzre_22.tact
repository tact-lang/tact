struct MultiType {
    num: Int;
    flag: Bool;
    addr: Address;
    data: Cell;
    slice: Slice;
    text: String;
}

contract MultiTypeStorage {
    store: MultiType;

    init() {
        self.store = MultiType {
            num: 42,
            flag: true,
            addr: myAddress(),
            data: emptyCell(),
            slice: emptyCell().asSlice(),
            text: "text"
        };
    }

    receive() {
        let _ = self.store.num;
    }
}