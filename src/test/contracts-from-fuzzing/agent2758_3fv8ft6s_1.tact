struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    value: NestedOptional;

    init() {
        self.value = NestedOptional{ a: null, b: true, c: "Hello" };
    }
}