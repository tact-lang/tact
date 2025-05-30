struct S {
    x: Int as uint4;
    y: Int;
    z: Int as uint32;
}

contract SerializeTest {
    data: S;

    init() {
        self.data = S{ x: 5, y: 123456789, z: 42 };
    }
}
