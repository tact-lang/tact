struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptTest {
    data: NestedOptional = NestedOptional{ a: null, b: null, c: null };

    init() {
        self.data = NestedOptional{ a: 123, b: true, c: "test" };
    }
}
