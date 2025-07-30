struct A {
    x: Int;
    y: Int?;
    z: Bool;
}

contract StorageTest {
    data: A;

    init() {
        self.data = A{
            x: 42,
            y: null,
            z: false
        };
    }
}