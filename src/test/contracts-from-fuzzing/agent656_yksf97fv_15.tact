struct Sub1 {
    value: Int;
}

struct Sub2 {
    optionalSub1: Sub1?;
}

struct Sub3 {
    optionalSub2: Sub2?;
}

contract NestedNullableChain(
    nested: Sub3?,
    ready: Bool,
    index: Int,
) {
}