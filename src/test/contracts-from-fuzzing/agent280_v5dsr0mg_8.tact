struct MultiType {
    flag: Bool;
    counter: Int;
    label: String;
    content: Cell;
    reference: Slice;
    addr: Address;
}

contract MixedTypes {
    data: MultiType;

    init() {
        self.data = MultiType{
            flag: true,
            counter: 42,
            label: "test",
            content: emptyCell(),
            reference: emptyCell().asSlice(),
            addr: myAddress(),
        };
    }
}