struct A {
    x: Int;
    y: Int;
}

struct B {
    a1: A;
    a2: A;
}

struct C {
    b: B;
    extra: Int;
}

contract DeepNestedStructContract {
    data: C;
    init() {
        self.data = C{
            b: B{ a1: A{ x: 1, y: 2 }, a2: A{ x: 3, y: 4 } },
            extra: 5
        };
    }
}