struct S1 { val: Int; }
struct S2 { s1: S1; val2: Int; }
struct S3 { s2: S2; val3: Int; }
struct S4 { s3: S3; val4: Int; }
struct S5 { s4: S4; val5: Int; }

contract DeepChain {
    top: S5;
    init() {
        self.top = S5{ s4:S4{ s3:S3{ s2:S2{ s1:S1{ val:1 }, val2:2 }, val3:3 }, val4:4 }, val5:5 };
    }
}