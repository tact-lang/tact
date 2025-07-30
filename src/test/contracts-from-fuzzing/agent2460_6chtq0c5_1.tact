struct NestedTester {
    a: Int;
    b: Bool;
    c: Inner1;
    d: Inner2;
}

struct Inner1 {
    x: Int?;
    y: Bool;
}

struct Inner2 {
    z: String;
    w: Bool?;
}

contract StorageTest {
    data: NestedTester;

    init() {
        self.data = NestedTester{
            a: 1,
            b: true,
            c: Inner1{ x: null, y: false },
            d: Inner2{ z: "hello", w: null }
        };
    }
}