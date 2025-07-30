struct S1 { a: Int }
struct S2 { b: Bool }

contract MixedParams(
    foo: Int?,
    bar: Bool?,
    s1: S1,
    s2: S2?,
    addr: Address?,
    comment: String?,
    blob: Cell?
) {}