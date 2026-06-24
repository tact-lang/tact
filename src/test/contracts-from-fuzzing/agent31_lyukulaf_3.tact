struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1: S1;
    x: Int;
}

contract FlatNestedTest {
    val: S2;

    init() {
        self.val = S2{
            s1: S1{ a: 10, b: false },
            x: 20,
        };
    }
}
