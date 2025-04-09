struct ParamInner {
    x: Int;
    y: Bool?;
}

contract ParamContract(
    a: Int,
    b: Bool?,
    inner: ParamInner,
    optInner: ParamInner?,
) {}
