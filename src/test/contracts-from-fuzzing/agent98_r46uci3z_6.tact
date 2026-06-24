struct MultiDefault {
    a: Int = 10;
    b: Bool = false;
    s: String = "hi";
}

contract DefaultStructFieldsTest {
    val: MultiDefault;

    init() {
        self.val = MultiDefault{};
    }
}