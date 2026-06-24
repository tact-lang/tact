struct OptionalCore {
    addr: Address?;
    cellData: Cell?;
    sliceData: Slice?;
}

contract Test {
    data: OptionalCore;

    init() {
        self.data = OptionalCore{
            addr: null,
            cellData: null,
            sliceData: null
        };
    }
}
