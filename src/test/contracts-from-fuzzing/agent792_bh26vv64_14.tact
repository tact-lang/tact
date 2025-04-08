struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: Int }

contract TestContract {
    opt1: S1?;
    req2: S2;
    opt3: S3?;

    init() {
        self.opt1 = S1{ a: 5 };
        self.req2 = S2{ b: true };
        self.opt3 = null;
    }
}