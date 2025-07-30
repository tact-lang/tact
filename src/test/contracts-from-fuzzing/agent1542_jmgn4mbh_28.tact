struct Inner {
    m: Int?;
}

struct Outer {
    x: Inner?;
}

contract Test(
    param: Outer
) {}