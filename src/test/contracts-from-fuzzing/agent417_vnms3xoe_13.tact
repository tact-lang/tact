struct S1 { a: Int; }
struct S2 { a: S1; }
struct S3 { a: S2; }
struct S4 { a: S3; }
struct S5 { a: S4; }

contract Test {
    field1: S1;
    field2: S2;
    field3: S3;
    field4: S4;
    field5: S5;
    init() {
        self.field1 = S1{ a:1 };
        self.field2 = S2{ a:self.field1 };
        self.field3 = S3{ a:self.field2 };
        self.field4 = S4{ a:self.field3 };
        self.field5 = S5{ a:self.field4 };
    }
}