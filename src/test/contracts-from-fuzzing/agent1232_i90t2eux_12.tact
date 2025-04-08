struct S1 { x: Int; }
struct S2 { x: Int; }
struct S3 { x: Int; }
struct S4 { x: Int; }
struct S5 { x: Int; }

contract ManyNestedStructs {
    a: S1;
    b: S2;
    c: S3;
    d: S4;
    e: S5;

    init() {
        self.a = S1{ x: 1 };
        self.b = S2{ x: 2 };
        self.c = S3{ x: 3 };
        self.d = S4{ x: 4 };
        self.e = S5{ x: 5 };
    }
}