struct Rec1 {
    a: Int;
    opt: Int?;
}

struct Rec2 {
    inner: Rec1;
    b: Bool;
}

contract ParamsWithDefaults(
    param: Rec2,
) {}