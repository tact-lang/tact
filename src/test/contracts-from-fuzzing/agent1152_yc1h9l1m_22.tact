struct S1 {
    foo: Int?;
}

struct S2 {
    bar: S1?;
}

contract Test {
    val: S2;

    init() {
        self.val = S2{ bar: S1{ foo: 44 } };
    }
}