struct Innermost {
    detail: String?;
}

struct MiddleLevel {
    nested: Innermost?;
    age: Int?;
}

struct Top {
    middle: MiddleLevel;
    flag: Bool;
}

contract ParamDeepNested(
    param: Top,
) {}