struct Nested { a: Int; b: Bool; c: String; }

contract TestContract {
    myField: Nested;

    init() {
        self.myField = Nested { a: 1, b: true, c: "hello" };
    }
}