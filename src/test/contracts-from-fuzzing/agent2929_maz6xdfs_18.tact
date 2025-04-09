struct Sub {
    score: Int as uint16 = 0;
    comment: String? = null;
}

struct Inner {
    data: Sub;
    note: String = "hi";
    flag: Bool? = null;
}

contract NestedParam(
    item: Inner,
    ready: Bool
) {}