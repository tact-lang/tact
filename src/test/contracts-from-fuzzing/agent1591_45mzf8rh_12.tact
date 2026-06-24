// Contract using contract parameters, with many types
contract ParamStyle(
    value: Int,
    flag: Bool,
    addr: Address,
    bigStr: String,
    cellData: Cell,
    sliceVal: Slice,
    optAddr: Address?,
    optStr: String?,
    optBool: Bool?,
) {
    receive() {
        // no-op handler
    }
}