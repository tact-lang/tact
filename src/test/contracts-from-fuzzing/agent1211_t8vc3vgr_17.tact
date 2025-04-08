struct Collection {
    n: Int;
    b: Bool;
    s: String;
    addr: Address;
    cell: Cell;
}

contract MixedCollection {
    v: Collection;
    init() {
        self.v = Collection{
            n: 1,
            b: true,
            s: "str",
            addr: myAddress(),
            cell: emptyCell(),
        };
    }
}