struct Sub {
    data: Int?;
    flag: Bool?;
}

contract ParamOpt(
    s: Sub?
) {
    receive() {}
}
