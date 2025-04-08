struct Deep2 {
    z: Int;
}

struct Deep1 {
    x: Int;
    y: Deep2;
}

contract ParamDeepStruct(
    val: Deep1,
    flag: Bool
) {}