struct S1 { a: Int; }
struct S2 { b: S1; }
struct S3 { c: S2; }

contract NestedOpts {
  data: S3? = null;
  init() { self.data = null; }
}