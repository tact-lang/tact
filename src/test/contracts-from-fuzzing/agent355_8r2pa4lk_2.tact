struct Nested {
    a: Int;
    b: Bool;
    c: Inner;
}

struct Inner {
    d: Int;
    e: Bool;
}

contract StorageTest {
    data: Nested;

    init() {
        self.data = Nested{
            a: 5,
            b: true,
            c: Inner{ d: 10, e: false }
        };
    }
}