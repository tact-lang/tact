struct A {
    x: Int;
}

struct B {
    y: A?;
}

contract NullableNested {
    data: B;

    init() {
        self.data = B {
            y: null,
        };
    }
}