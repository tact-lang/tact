// test deeply nested contract params with optionals
struct CNest {
    x: Int?;
    y: SubC?;
}

struct SubC {
    foo: Bool?;
    bar: String?;
}

contract ParamDeepOpt(
    nest: CNest?
) {}