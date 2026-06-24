// contract parameter deeply nested struct
struct S1 { val: Int; }
struct S2 { inner: S1; }

contract Test(
  foo: S2
) {}