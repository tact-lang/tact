contract ParamsContract(
    val: Int,
    flag: Bool,
    addr: Address,
    cellVal: Cell,
    maybeInt: Int?
) {
    receive() {} // reference contract param fields in compiled code
}