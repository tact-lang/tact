struct OptRefs {
    cellOpt: Cell?;
    addrOpt: Address?;
    boolOpt: Bool?;
}

contract OptionalRefsTest {
    val: OptRefs;

    init() {
        self.val = OptRefs{
            cellOpt: emptyCell(),
            addrOpt: myAddress(),
            boolOpt: null
        };
    }
}