// Very deep nested optional chain with structs
struct S4 { val: Int; }
struct S3 { s4: S4?; }
struct S2 { s3: S3?; }
struct S1 { s2: S2?; }

contract VeryDeepChain {
    opt: S1?;
}