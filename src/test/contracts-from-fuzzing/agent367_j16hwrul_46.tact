// optional contract param with nested struct (defaults omitted)
struct OptParamInner {
    val: Int?;
    ok: Bool?;
}
contract ParamOptComplex(
    data: OptParamInner?
) {
    receive() {}
}