struct Det {
    a: Int;
    b: Bool?;
    c: String;
    d: String?;
}

contract ParamNested(
    param: Det,
    flag: Bool,
    note: String?,
) {
    get fun g(): Int { return self.param.a; }
}