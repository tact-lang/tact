struct S2 {
    y: Int;
}

struct S1 {
    innerOpt: S2?;
    label: String;
}

contract ParamNest(
    meta: S1,
    id: Int
) {}
