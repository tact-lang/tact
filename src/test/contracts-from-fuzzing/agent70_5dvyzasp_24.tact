struct A {
    x: Int;
}

struct B {
    y: A?;
}

contract ContractTest {
    f: B;

    init() {
        self.f = B{ y: null };
    }
}