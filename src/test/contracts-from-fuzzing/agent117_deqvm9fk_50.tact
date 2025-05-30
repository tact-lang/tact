// A big nested optional inside contract param
struct Sub {
    val: Int?;
}

contract ContractParamNestedOpt(
    foo: Sub?
) {
}