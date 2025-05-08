struct StructWithDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "hello";
}

contract TestContract {
    data: StructWithDefaults = StructWithDefaults{};

    init() {
        self.data = StructWithDefaults{ a: 42, b: false, c: "world" };
    }
}