struct Nested {
    inner: Int;
}

struct Outer {
    nested: Nested;
    flag: Bool;
}

contract StorageTest {
    data: Outer;
    init() {
        self.data = Outer{ nested: Nested{ inner: 10 }, flag: true };
    }

    receive() {
        self.data = Outer{ nested: Nested{ inner: 20 }, flag: false };
    }
}