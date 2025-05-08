struct Deepest {
    d: Int?;
}

struct Inner {
    nested: Deepest?;
}

contract TestContract(
    param: Inner?,
) {}