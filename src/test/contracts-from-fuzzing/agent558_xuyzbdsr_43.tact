// Chain of nullable contract params
struct S1 { val: Int?; }
struct S2 { inner: S1?; }
struct S3 { nested: S2?; }

contract Test(foo: S3?) {}