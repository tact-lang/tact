struct SOpt {
    f:Int?=null;
}

contract StructWithOptionalDefault {
    s:SOpt=sOpt();
}

fun sOpt():SOpt {
    return SOpt{};
}
