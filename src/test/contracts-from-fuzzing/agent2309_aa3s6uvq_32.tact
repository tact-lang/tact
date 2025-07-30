// nested optional struct in contract parameter with optional field
struct DeepOptional {
    inner: InnerOpt?;
}
struct InnerOpt {
    val: Int?;
}

contract ParamConv(
    p: DeepOptional?
) {}