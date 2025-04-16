struct MultiType {
    number: Int;
    text: String;
    flag: Bool;
    data: Cell;
    addr: Address;
}

contract MultiTypeContract {
    field: MultiType;

    init() {
        self.field = MultiType{
            number: 123,
            text: "abc",
            flag: true,
            data: emptyCell(),
            addr: myAddress(),
        };
    }
}
