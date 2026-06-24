struct Parent {
    a: Int;
}
struct Child {
    p: Parent;
}

contract SingleNestedParam(
    child: Child
) {
    receive() {}
}