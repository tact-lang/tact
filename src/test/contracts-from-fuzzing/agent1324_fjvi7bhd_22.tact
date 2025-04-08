struct Params {
    id: Int;
    tag: String?;
}

contract ParamBased(
    p: Params,
    opt: Params? // left implicit null
) {}
