struct A {
    x: Int?;
    y: Int;
}

struct B {
    a: A?;
    z: Int;
}

contract StorageTest {
    b: B;

    init() {
        self.b = B{
            a: null,
            z: 7
        };
    }
}