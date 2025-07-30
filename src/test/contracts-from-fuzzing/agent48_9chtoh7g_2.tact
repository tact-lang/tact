struct Nested {
    a: Int = 5;
    b: Bool?;
    c: String = "hi";
}

contract TestContract {
    nest: Nested;

    init() {
        self.nest = Nested{};
    }
    receive() {
        self.nest = Nested{ a: 10, c: "bye" };
    }
}
