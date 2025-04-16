struct Child {
    x: Int?;
}

struct Parent {
    c: Child?;
}

contract NestedImplicitNulls {
    val: Parent?;
}