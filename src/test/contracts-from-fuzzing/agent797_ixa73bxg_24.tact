struct InnerMath {
    val: Int = 2 * 21;
    flag: Bool = (1 + 1) == 2;
}

struct OuterCombo {
    num: Int = 5 * 2;
    str: String = "test";
    opt: Int? = null;
    boolVal: Bool = true;
    nestedOpt: InnerMath? = null;
    nestedReq: InnerMath = InnerMath{};
}

contract TestMixComputed {
    data: OuterCombo = OuterCombo{};
    init() {}
}