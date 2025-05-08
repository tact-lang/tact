struct MultiRefs {
    a: Address;
    b: Address?;
    c: Cell;
    d: Cell?;
    e: Slice;
    f: Slice?;
}

contract RefsTest {
    refs: MultiRefs;

    init() {
        self.refs = MultiRefs{
            a: myAddress(),
            b: null,
            c: emptyCell(),
            d: null,
            e: emptyCell().asSlice(),
            f: null,
        };
    }
}