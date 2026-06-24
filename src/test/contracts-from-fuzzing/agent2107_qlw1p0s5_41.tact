struct Inner {
    x: Int?;
    y: Bool?;
}

struct Outer {
    a: Int;
    b: Inner;
    c: String?;
}

contract ParamDeep(
    payload: Outer,
) {
}