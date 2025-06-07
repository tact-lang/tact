struct S1 {
    a: Int;
}

struct S2 {
    b: String;
}

struct S3 {
    c: Bool;
}

struct NestedAll {
    s1: S1;
    s2: S2?;
    s3: S3;
}

contract StructWithNestedMix(
    mixed: NestedAll,
    enabled: Bool,
    text: String,
) {
}