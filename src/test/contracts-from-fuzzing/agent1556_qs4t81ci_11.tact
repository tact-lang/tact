// very deeply nested structs, push depth
struct S4 { v: Int = 4; }
struct S3 { s4: S4 = S4{}; }
struct S2 { s3: S3 = S3{}; }
struct S1 { s2: S2 = S2{}; }

contract TestContract {
    val: S1 = S1{};

    init() {
        self.val = S1{s2: S2{s3: S3{s4: S4{v: 1234}}}};
    }

    receive() {
        let _ = self.val.s2.s3.s4.v;
    }
}