// testing large contract params list with mixed types
contract ManyParams(
    a: Int,
    b: Int?,
    c: Bool,
    d: Bool?,
    e: String,
    f: Address?,
    g: Cell,
    h: Slice,
    i: Inner,
    j: Outer,
) {
}

struct Inner {
    foo: Int;
}

struct Outer {
    bar: Bool;
}
