struct InnerOpt {
    val: Int?;
}

struct OuterParam {
    inn: InnerOpt;
    text: String;
}

contract NestedParamSyntax(
    stuff: OuterParam,
) {}