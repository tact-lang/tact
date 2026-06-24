struct S1 {v: Int;}
struct S2 {s: S1;}
struct S3 {s: S2;}
struct S4 {s: S3;}
struct S5 {s: S4;}
contract S5Contract {
    d: S5;
    init() {
        self.d = S5{ s: S4{ s: S3{ s: S2{ s: S1{ v: 5 } } } } };
    }
}