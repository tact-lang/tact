struct MixedRefs {
    a1: Address;
    a2: Address?;
    c1: Cell;
    c2: Cell?;
}

contract TestContract {
    refs: MixedRefs;

    init() {
        self.refs = MixedRefs{
            a1: myAddress(),
            a2: null,
            c1: emptyCell(),
            c2: null
        };
    }
}