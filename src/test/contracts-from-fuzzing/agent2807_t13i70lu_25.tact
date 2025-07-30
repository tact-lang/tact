message(1) M {
    val: Int;
}

struct Composite {
    m: M;
    txt: String;
}

contract NestedParam(
    c: Composite
) {}