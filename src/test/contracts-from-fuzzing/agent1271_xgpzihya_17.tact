struct ParamWrap {
    x: Int;
    y: Bool?;
    z: String;
}

contract ParamComposite(
    p: ParamWrap,
    flag: Bool,
    count: Int,
) {
    receive() {}
}