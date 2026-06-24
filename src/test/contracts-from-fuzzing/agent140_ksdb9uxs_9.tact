struct S1 { f1: Int }
struct S2 { f2: Int }
struct S3 { f3: Int }
struct S4 { f4: Int }
struct S5 { f5: Int }

contract ManyStructFields {
    a: S1;
    b: S2;
    c: S3;
    d: S4;
    e: S5;

    init() {
        self.a = S1{ f1: 1 };
        self.b = S2{ f2: 2 };
        self.c = S3{ f3: 3 };
        self.d = S4{ f4: 4 };
        self.e = S5{ f5: 5 };
    }
}