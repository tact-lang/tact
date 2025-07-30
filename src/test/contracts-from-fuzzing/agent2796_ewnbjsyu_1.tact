struct Nested {
    n: Inner?;
}

struct Inner {
    x: Int;
    y: Bool?;
}

contract EdgeCaseTest {
    data: Nested;

    init() {
        self.data = Nested{ n: null };
    }
}