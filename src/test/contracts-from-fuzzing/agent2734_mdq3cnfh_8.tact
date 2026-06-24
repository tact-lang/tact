struct S1 { v: Int }
struct S2 { v: Int }
struct S3 { v: Int }
struct S4 { v: Int }
struct S5 { v: Int }

contract TestCombo {
    f1: S1;
    f2: S2?;
    f3: S3;
    f4: S4?;
    f5: S5;

    init() {
        self.f1 = S1{v:1};
        self.f2 = null;
        self.f3 = S3{v:3};
        self.f4 = S4{v:4};
        self.f5 = S5{v:5};
    }
}
