// deeply nested optional on optional on optional param
contract SuperOptional(
    outer: Outer?,
) {}

struct Leaf {
    a: Int?;
}

struct Middle {
    leaf: Leaf?;
}

struct Outer {
    mid: Middle?;
}
