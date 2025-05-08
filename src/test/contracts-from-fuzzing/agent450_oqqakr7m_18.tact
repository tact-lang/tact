struct Child {
    val: Int;
}

struct Parent {
    id: Int;
    child: Child;
}

contract ParamsNested(
    root: Parent,
) {}