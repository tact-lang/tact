struct Inner {
    a: Int;
    b: Bool?;
    c: String?;
}

struct Middle {
    x: Inner;
    y: String;
}

struct Outer {
    p: Middle;
    q: Int?;
}

contract Test(
    deep: Outer,
) {}