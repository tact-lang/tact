struct Nested {
    x: Int;
    y: Int;
}

struct Outer {
    inner: Nested;
    flag: Bool;
}

contract C(
    data: Outer
) {}