struct Sub {
    num: Int as int64;
    flag: Bool;
}

contract NestedParamContract(
    sub: Sub,
    optSub: Sub?,
    info: String
) {}