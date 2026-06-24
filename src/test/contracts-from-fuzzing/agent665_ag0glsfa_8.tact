struct S1 { i: Int }
struct S2 { b: Bool }
struct S3 { s: String }

contract ManyStructs {
    s1: S1 = S1{ i:1 };
    s2: S2 = S2{ b:true };
    s3: S3 = S3{ s:"x" };

    init() {
        self.s1 = self.s1;
        self.s2 = self.s2;
        self.s3 = self.s3;
    }

    receive() {
        let _ = self.s1;
        let _ = self.s2;
        let _ = self.s3;
    }
}