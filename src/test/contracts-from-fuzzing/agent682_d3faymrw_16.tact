struct CC {
    addr: Address;
    cell: Cell;
    str: String;
}

contract TestContract {
    cc: CC;

    init() {
        self.cc = CC{
            addr: myAddress(),
            cell: emptyCell(),
            str: "hi"
        };
    }
}