struct S0 { x: Int; }
struct S1 { s: S0; }
struct S2 { s: S1; }
struct S3 { s: S2; }
struct S4 { s: S3; }
contract DeepChain {
    d: S4 = S4{ s: S3{ s: S2{ s: S1{ s: S0{ x: 10 } } } } };
}