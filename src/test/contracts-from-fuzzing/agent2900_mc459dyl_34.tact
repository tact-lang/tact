struct ParamsStruct {
    p1: Int as uint8;
    p2: Bool?;
    p3: String;
}

contract ParamOpt(
    s: ParamsStruct?,
    x: Int as int4,
    y: String?,
) {}