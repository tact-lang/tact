struct A {
    foo: Int = 1;
    bar: Int?;
}

struct B {
    inner: A?;
    val: Int = 2;
}

struct C {
    innerB: B?;
    extra: Int = 3;
}

contract Test {
    data: C;

    init() {
        self.data = C{ innerB: null, extra: 100 };
    }
}