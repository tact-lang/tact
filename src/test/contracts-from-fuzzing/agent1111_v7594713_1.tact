struct Nested {
    flag: Bool;
    count: Int;
}

contract PersistentTest {
    point: Nested; // deeply nested struct as persistent storage

    init() {
        self.point = Nested{flag: true, count: 5};
    }
}