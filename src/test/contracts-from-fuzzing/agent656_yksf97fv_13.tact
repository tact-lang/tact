struct S1 {
    v1: Int;
    v2: Bool;
}

struct S2 {
    s1: S1;
    str: String?;
}

struct S3 {
    s2: S2;
    note: String;
}

contract ChainNested(
    c: S3,
    ready: Bool,
    counter: Int,
) {
}