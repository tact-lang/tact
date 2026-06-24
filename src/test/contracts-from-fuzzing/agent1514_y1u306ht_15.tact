struct A {
    a: Int?;
}

struct B {
    a: A?;
    b: Int;
}

contract Test {
    st: B = B{a: null, b: 1};
    init() {
        self.st = B{a: A{a: 2}, b: 20};
    }
}