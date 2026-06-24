struct S1 { a: Int }
struct S2 { nested: S1 }

contract OptReplace {
    st: S2?;

    init() {
        self.st = null;
        self.st = S2{ nested:S1{a:123} };
    }
}