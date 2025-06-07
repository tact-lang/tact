struct A {
    value: Int;
}

struct B {
    inner: A?;
}

contract StructOptionalInner {
    b: B;

    init() {
        self.b = B{ inner: A{ value: 777 } };
    }
}