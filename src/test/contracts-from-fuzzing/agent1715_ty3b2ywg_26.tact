struct OptionalAddrCellSlice {
    addr: Address?;
    cell: Cell?;
    sl: Slice?;
}

contract TestContract {
    val: OptionalAddrCellSlice = OptionalAddrCellSlice{
        addr: null,
        cell: null,
        sl: null
    };
}