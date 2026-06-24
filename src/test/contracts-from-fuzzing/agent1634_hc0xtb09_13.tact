struct A {
    a: Int?;
}

struct B {
    b: A?;
}

contract TestContract {
    root: B;

    init() {
        self.root = B{
            b: null,
        };
    }
}