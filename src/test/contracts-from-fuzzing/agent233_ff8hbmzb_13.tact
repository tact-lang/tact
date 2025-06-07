struct S5 { value: Int; }
struct S4 { s5: S5; }
struct S3 { s4: S4; }
struct S2 { s3: S3; }
struct S1 { s2: S2; }

contract DeepChain {
    data: S1;

    init() {
        self.data = S1{ s2: S2{ s3: S3{ s4: S4{ s5: S5{ value: 42 } } } } };
    }

    receive() {
        let _ = self.data.s2.s3.s4.s5.value;
    }
}