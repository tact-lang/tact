struct S1 {
    a: Int;
}

struct S2 {
    b: S1;
}

contract InitOrderTest {
    f: S2;

    init() {
        self.f = S2{
            b: S1{a: 123}
        };
    }
}