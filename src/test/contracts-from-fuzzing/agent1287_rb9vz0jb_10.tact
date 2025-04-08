// Use contract parameter list with many fields of different types
contract ParamTest(
    ai: Int,
    ab: Bool,
    an: Int?,
    bb: Bool?,
    ss: String,
    sn: String?,
    cl: Cell,
    clOpt: Cell?,
    addr: Address,
    addrOpt: Address? 
) {
    get fun dummy(): Int { return 0; }
}