// Optional inside optional inside struct
struct Inner {
    val: Int?;
}

struct Outer {
    node: Inner?;
}

contract NestedOptOpt {
    data: Outer = Outer{ node: null };
}
