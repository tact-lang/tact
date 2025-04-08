struct S1 { a: Int }
struct S2 { b: Bool; c: Int as uint8 }
struct S3 { d: Address; e: Int as coins }

contract MultiStructs {
    s1: S1;
    s2: S2;
    s3: S3;

    init() {
        self.s1 = S1{ a: 42 };
        self.s2 = S2{ b: true, c: 7 };
        self.s3 = S3{ d: myAddress(), e: ton("2") };
    }
}