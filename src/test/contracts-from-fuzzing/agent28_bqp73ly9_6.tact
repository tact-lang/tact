struct S {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}

contract StructDefaultTest {
    s: S;

    init() {
        self.s = S{};
    }
}