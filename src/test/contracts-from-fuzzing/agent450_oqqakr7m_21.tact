struct Inner {
    foo: Int?;
}

contract MixedParams(
    a: Int,
    b: Bool,
    c: String,
    d: Int?,
    e: Bool?,
    f: String?,
    g: Address?,
    h: Inner,
) {}