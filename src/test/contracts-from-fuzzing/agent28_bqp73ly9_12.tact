struct A {
    s: String?;
}

struct B {
    x: A;
    y: A?;
}

contract NestedOptionals {
    data: B;

    init() {
        self.data = B{
            x: A{ s: null },
            y: null,
        };
    }
}