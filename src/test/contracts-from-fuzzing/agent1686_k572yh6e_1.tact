struct Nested {
    x: Int = 1;
    y: Bool?;
    z: String = "abc";
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{ y: true };
    }
}