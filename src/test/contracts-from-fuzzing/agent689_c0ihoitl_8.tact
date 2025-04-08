struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1: S1;
    s1copy: S1;
}

contract DuplicateStructsTest {
    val: S2;

    init() {
        self.val = S2{
            s1: S1{ a: 1, b: true },
            s1copy: S1{ a: 2, b: false },
        };
    }
}