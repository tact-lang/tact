struct Base {
    id: Int;
    name: String;
}

struct Container {
    base: Base;
    flag: Bool;
}

contract NestedNormal(
    outer: Container?,
    ready: Bool,
    index: Int,
) {
}