struct Inner {
    foo: Int;
    flag: Bool?;
}

struct Outer {
    deep: Inner?;
}

contract Test(
    num: Int,
    switch: Bool,
    text: String?,
    inner: Inner,
    outer: Outer
) {}
