struct MultiType {
    i: Int;
    b: Bool;
    str: String;
    c: Cell;
    addr: Address;
}

contract TestContract {
    d: MultiType;

    init() {
        self.d = MultiType{
            i: 99,
            b: true,
            str: "hi",
            c: emptyCell(),
            addr: myAddress(),
        };
    }
}