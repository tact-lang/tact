struct Nested { inner: Int; }

contract ParamWithStruct(
    n: Nested,
    i: Int,
    s: String,
    b: Bool,
    o: Int?
) {}
