struct Nested {
    x: Int;
    y: Int?;
    s: String;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{ x: 1, y: null, s: "hello" };
    }
}