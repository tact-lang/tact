struct OptLowLevel {
    cell: Cell?;
    slice: Slice?;
    builder: Builder?;
}

contract OptLowLevelHolder {
    data: OptLowLevel;

    init() {
        self.data = OptLowLevel{
            cell: null,
            slice: null,
            builder: null
        };
    }
}