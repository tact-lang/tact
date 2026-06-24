contract TestContract(
    optNested: Inner?
) {
}

struct Inner {
    a: Int;
    b: Bool;
    str: String?;
}