struct FieldDefaults {
    a: Int = 1;
    b: Bool?;
    c: String = "hello";
}

contract DefaultStructTest {
    data: FieldDefaults;

    init() {
        self.data = FieldDefaults{};
    }
}
