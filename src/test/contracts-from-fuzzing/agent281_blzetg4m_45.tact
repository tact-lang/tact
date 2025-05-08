// Compose nested chain with default assigned nested struct
struct S3 { x: Int; }
struct S2 { y: S3 = S3{ x:1 }; }
struct S1 { z: S2 = S2{}; }

contract NestedDefStructVal {
  chain: S1;

  init() {
     self.chain = S1{};
  }
}