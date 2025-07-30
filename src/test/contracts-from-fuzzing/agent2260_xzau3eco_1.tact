struct Nested {
    a: Int;
    b: Bool;
}

contract DeepFieldContract {
    n: Nested;
    val: Int;

    init() {
        self.n = Nested{ a: 1, b: true };
        self.val = 42;
    }
}