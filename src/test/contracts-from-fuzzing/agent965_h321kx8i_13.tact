struct A {
    b: Int?;
    c: B?;
}

struct B {
    d: Int?;
    e: String?;
}

contract NullableDemo {
    data: A;

    init() {
        self.data = A{
            b: null,
            c: null,
        };
    }
}