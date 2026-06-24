struct S1 { val: Int }
struct S2 { val: Int }
struct S3 { val: Int }
struct S4 { val: Int }
struct S5 { val: Int }

contract LotsOfStructs {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;

    init() {
        self.s1 = S1{ val: 1 };
        self.s2 = S2{ val: 2 };
        self.s3 = S3{ val: 3 };
        self.s4 = S4{ val: 4 };
        self.s5 = S5{ val: 5 };
    }
}