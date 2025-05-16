struct Defaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultFieldsTest {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}