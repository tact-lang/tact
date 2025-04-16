struct Nested { a: Int; b: String; c: Bool }

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{ a: 1, b: "hello", c: true };
    }
}