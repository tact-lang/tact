struct A {
    x: Int as uint4;
    y: Bool;
}

struct B {
    inner: A;
    z: Int as int64;
}

contract NestedSerialization {
    data: B;

    init() {
        self.data = B{
            inner: A{ x: 8, y: true },
            z: -12345
        };
    }
}