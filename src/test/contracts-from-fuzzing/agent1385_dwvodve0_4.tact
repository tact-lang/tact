struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: String }
struct S4 { d: Address }

contract TestContract {
    f1: S1;
    f2: S2;
    f3: S3;
    f4: S4;

    init() {
        self.f1 = S1{ a: 1 };
        self.f2 = S2{ b: true };
        self.f3 = S3{ c: "ok" };
        self.f4 = S4{ d: myAddress() };
    }
}