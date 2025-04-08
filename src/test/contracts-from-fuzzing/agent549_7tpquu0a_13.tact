struct Defaulted {
    a: Int = 10;
    b: Bool = false;
    c: String = "abc";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract DefaultsTest {
    val: Defaulted;
    init() {
        self.val = Defaulted{};
    }
}