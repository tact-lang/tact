struct ComplexWrap {
    addr: Address;
    cell: Cell;
    flag: Bool;
    num: Int;
    str: String;
    optStr: String?;
}

contract WrapsAll {
    val: ComplexWrap;
    init() {
        self.val = ComplexWrap{
            addr: myAddress(),
            cell: emptyCell(),
            flag: true,
            num: 10,
            str: "hello",
            optStr: null
        };
    }
}