struct ABC {
    a: Int;
    b: Int;
    c: Int;
}

contract OrderingTest {
    field: ABC;
    init() {
        self.field = ABC{
            a: 1,
            b: 2,
            c: 3,
        };
    }
}