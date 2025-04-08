struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    inner: S1;
}

contract NestedMulti {
    data: S2;

    init() {
        self.data = S2{
            b: 5,
            inner: S1{ a: 7 },
        };
    }
}