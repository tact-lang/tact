struct CalcDefaults {
    a: Int = 2 + 3;
    b: Int = 10 * 10;
    c: Int = 7 - 4;
    d: Bool = (2 + 2) == 4;
}

contract TestExprStruct {
    data: CalcDefaults = CalcDefaults{};
    init() {}
}