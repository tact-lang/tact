struct A {
    a: Int?;
}

struct B {
    b: A?;
}

contract Test {
    data: B;

    init() {
        self.data = B{b: A{a: null}};
    }
}