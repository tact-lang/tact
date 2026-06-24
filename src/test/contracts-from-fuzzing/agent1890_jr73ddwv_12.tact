struct WithRemaining {
    s: Slice as remaining;
}

contract ContractSliceRem {
    field: WithRemaining;

    init() {
        self.field = WithRemaining{
            s: emptyCell().asSlice()
        };
    }
}