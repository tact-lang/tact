// now test optional persistent param containing nested optional struct
struct DeepIn {
    foo: Int?;
}

struct MidWrap {
    leaf: DeepIn;
}

contract ParamWrappedOpt(
    param: MidWrap?,
) {
    receive() {}
}