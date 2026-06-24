struct OptionalRefs {
    addr1: Address?;
    addr2: Address?;
    cell1: Cell?;
    cell2: Cell?;
}

contract OptRefsPersist {
    data: OptionalRefs;

    init() {
        self.data = OptionalRefs{
            addr1: null,
            addr2: null,
            cell1: null,
            cell2: null
        };
    }
}
