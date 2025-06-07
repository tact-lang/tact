struct S1 { a: Int = 1; }
struct S2 { b: Int?; c: Bool = false; d: S1; }
struct S3 { e: S2; f: Int = 2; }

contract OptNestedMix {
    data: S3 = S3{ e: S2{ d: S1{} } };
    init() {}
}