struct Child {
    c: Int;
}

struct Parent {
    child: Child;
}

contract NestedParam(
    p: Parent
) {
}