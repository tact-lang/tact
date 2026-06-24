struct A {
    x: Int as uint8;
    y: Int as uint8;
}

struct B {
    inner: A;
    z: Int as uint16;
}

contract SerialNested {
    data: B;
    init() {
        self.data = B{ inner: A{ x:1, y:2 }, z: 300 };
    }
}