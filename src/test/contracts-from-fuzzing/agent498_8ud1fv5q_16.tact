struct S1 {
    v: Int;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
    v: Bool?;
}

contract ChainOptional {
    val: S3 = S3{s2: S2{s1: S1{v:1}}, v: null};
}