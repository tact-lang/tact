struct Leaf {
    d: Int?;
}

struct Middle {
    c: Leaf?;
}

contract ParamNested(
    root: Middle?
) {
}