// deeply nested optional inside parameter
struct DeepOpt { inner: Int? }
contract ParamDeepOpt(
    v: DeepOpt?,
) {}
