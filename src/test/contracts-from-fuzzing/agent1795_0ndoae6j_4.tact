struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: String; }
struct S4 { d: Cell; }
struct S5 { e: Address; }

contract WideFields {
    f1: S1;
    f2: S2;
    f3: S3;
    f4: S4;
    f5: S5;

    init() {
        self.f1 = S1{ a: 1 };
        self.f2 = S2{ b: true };
        self.f3 = S3{ c: "hello" };
        self.f4 = S4{ d: emptyCell() };
        self.f5 = S5{ e: myAddress() };
    }
}