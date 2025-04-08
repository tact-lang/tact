struct MultiRefs {
    a: Address;
    b: Address;
    c: Cell;
    d: Cell;
    e: Address?;
    f: Cell?;
}

contract RefFields {
    refs: MultiRefs;

    init() {
        self.refs = MultiRefs{
            a: myAddress(),
            b: myAddress(),
            c: emptyCell(),
            d: emptyCell(),
            e: null,
            f: null
        };
    }
}