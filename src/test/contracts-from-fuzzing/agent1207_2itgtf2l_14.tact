struct S {
    a: Int = 1;
    b: Int;
    c: Int = 3;
}

contract StructDefaultsTest {
    f: S;

    init() {
        self.f = S{ b: 2 };
    }
}