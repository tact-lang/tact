struct S1 {a: Int;}
struct S2 {b: Bool;}
struct S3 {c: String;}
struct S4 {d: Address;}
struct S5 {e: Cell;}

struct Nest1 { s: S1; }
struct Nest2 { s: S2; }
struct Nest3 { s: S3; }
struct Nest4 { s: S4; }
struct Nest5 { s: S5; }

contract TestContract {
    f1: Nest1;
    f2: Nest2;
    f3: Nest3;
    f4: Nest4;
    f5: Nest5;

    init() {
        self.f1 = Nest1{ s: S1{ a: 1 } };
        self.f2 = Nest2{ s: S2{ b: true } };
        self.f3 = Nest3{ s: S3{ c: "hi" } };
        self.f4 = Nest4{ s: S4{ d: myAddress() } };
        self.f5 = Nest5{ s: S5{ e: emptyCell() } };
    }
}
