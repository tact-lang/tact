struct A {
    a: Int;
    b: Bool;
}

struct B {
    c: Int?;
    d: String;
}

contract AdjacentStructs(
    first: A,
    second: B?,
    cnt: Int,
) {
}