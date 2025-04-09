// deeply nested contract parameters
struct S3 { z: Int; }
struct S2 { y: S3; }
struct S1 { x: S2; }

contract ParamsChain(
    p: S1
) {}