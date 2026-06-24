// test optional wrapping of contract parameter with nested optional
struct SubWrap {
    x: Int?;
    y: Bool;
}

contract OptParamNestedOpt(
    p: SubWrap?
) {}