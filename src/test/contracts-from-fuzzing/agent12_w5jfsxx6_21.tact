struct Child {
    x: Int?;
}

struct Parent {
    c: Child?;
}

contract DeepParamDefault(
    p: Parent,
) {}