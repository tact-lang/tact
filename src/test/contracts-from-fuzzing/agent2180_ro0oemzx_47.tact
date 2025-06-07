struct Sub {
    s: String;
}

struct Top {
    sub: Sub;
    opt: Int?;
}

contract NestedSubstructure(
    obj: Top,
) {}