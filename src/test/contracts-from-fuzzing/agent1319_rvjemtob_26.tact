struct Ints {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
}

contract ManyIntsTest {
    ints: Ints;

    init() {
        self.ints = Ints{ a: 1, b:2, c:3, d:4, e:5, f:6 };
    }
}