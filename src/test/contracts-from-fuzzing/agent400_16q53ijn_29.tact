// Test no init function, default implicit init and large opt chain
struct S3 {
    val: Int;
}

struct S2 {
    s3: S3?;
}

struct S1 {
    s2: S2?;
}

contract ChainOptNoInit {
    opt: S1?;
}