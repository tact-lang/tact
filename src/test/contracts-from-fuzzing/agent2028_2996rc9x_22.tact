struct S1 { val1: Int }
struct S2 { val2: Int }
struct S3 { val3: Int }
struct S4 { val4: Int }
struct S5 { val5: Int }

contract BigNestedStorage {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;

    init() {
        self.s1 = S1{ val1: 1 };
        self.s2 = S2{ val2: 2 };
        self.s3 = S3{ val3: 3 };
        self.s4 = S4{ val4: 4 };
        self.s5 = S5{ val5: 5 };
    }
}
