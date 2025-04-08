struct S1 { x: Int }
struct S2 { y: S1 }
struct S3 { z: S2 }

contract NestedChainStorage {
    nested: S3 = S3{ z: S2{ y: S1{ x: 123 } } };
}