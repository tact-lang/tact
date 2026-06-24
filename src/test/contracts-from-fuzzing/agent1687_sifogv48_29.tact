struct Inner {
    data: Next;
}

struct Next {
    x: Int;
    flag: Bool;
}

contract Deep(
    nested: Inner
) {
}
