struct SDefault {
    i: Int = 42;
    b: Bool = true;
    s: String = "abc";
}

contract StructFieldDefaults {
    data: SDefault = SDefault{};

    init() {
        self.data = SDefault{i: 777, b: false, s: "xyz"};
    }
}
