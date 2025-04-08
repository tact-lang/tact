struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: String }

contract TestContract(
    s1: S1,
    s2: S2,
    s3: S3,
) {
    receive() {}
}
