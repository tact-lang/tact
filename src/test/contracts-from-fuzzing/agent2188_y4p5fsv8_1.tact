struct Nested {
    inner1: Bool;
    inner2: Int?;
}

contract TestContract {
    outer1: Int = 1;
    outer2: Nested;

    init() {
        self.outer2 = Nested{
            inner1: true,
            inner2: null,
        };
    }
}