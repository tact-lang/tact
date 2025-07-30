struct StructA {
    x: Int;
}

struct StructB {
    y: StructA;
}

contract OptionalMidInner {
    data: StructB? = null;
}