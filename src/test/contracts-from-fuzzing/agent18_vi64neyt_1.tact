struct Nested { a: Int; b: Bool; c: String; }

contract Test1 {
    nestedField: Nested; 

    init() {
        self.nestedField = Nested{ a: 1, b: true, c: "test" };
    }
}