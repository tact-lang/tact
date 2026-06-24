struct Flattened {
    x: Int;
    y: Bool;
}

contract FlattenedTest {
    a: Int;
    b: Bool;
    s: Flattened;

    init() {
        self.a = 123;
        self.b = false;
        self.s = Flattened{
            x: 456,
            y: true,
        };
    }
}