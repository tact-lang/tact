// optional field in contract parameters with nested struct optional
struct InnerOpt {
    val: Int?;
}

contract OptParamNested(
    data: InnerOpt?
) {
    receive() {}
}