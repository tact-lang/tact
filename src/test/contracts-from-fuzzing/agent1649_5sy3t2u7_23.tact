struct Defaulted {
    a: Int = 123;
    b: Bool = true;
    c: String = "default";
}

contract DefaultsTest {
    val: Defaulted;

    init() {
        self.val = Defaulted{};
    }
}