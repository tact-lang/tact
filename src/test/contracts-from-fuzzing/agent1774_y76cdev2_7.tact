struct A {
    x: Int?;
}

struct B {
    y: Int;
    z: A?;
}

contract TestContract {
    inner: B?;

    init() {
        self.inner = B{
            y: 7,
            z: null,
        };
    }
}
