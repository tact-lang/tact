struct InnerS {
    v: Int? = null;
    flag: Bool = true;
}

contract TestContract {
    n1: InnerS = InnerS{ v: null, flag: true };
    n2: InnerS = InnerS{ v: 42, flag: false };
    optInt: Int? = 7;
    optBool: Bool? = null;
    plain: Int = -1;
}