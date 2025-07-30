struct A {
    b: B?;
}

struct B {
    value: Int;
}

contract OptionalStructField {
    data: A;

    init() {
        self.data = A{ b: null };
    }
}