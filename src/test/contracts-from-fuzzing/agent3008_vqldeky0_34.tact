struct ParamPack {
    x: Int;
    y: Bool;
    z: String;
}

contract ParamsStorage(
    foo: ParamPack,
    opt: ParamPack?,
    str: String,
    num: Int,
) {}