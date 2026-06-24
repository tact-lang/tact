struct Defaulted {
    a: Int = 1;
    b: Bool = false;
    c: String = "xx";
    d: Int? = null;
}

contract Test {
    val: Defaulted;
    init() {
        self.val = Defaulted{};
    }
}
// test nested struct with all defaults and init via empty braces