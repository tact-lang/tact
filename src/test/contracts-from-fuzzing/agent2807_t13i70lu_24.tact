struct S { foo: Int }
message(42) M { bar: Int }

contract ComplexParams(
    s: S,
    m: M,
    maybe: Int?
) {}