struct S1 { a: Int }
struct S2 { b: Int }

contract MultiStructs {
    f1: S1?;
    f2: S2?;

    init() {
        self.f1 = null;
        self.f2 = null;
    }
}