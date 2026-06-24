struct HasDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
    d: Address? = null;
}

contract DefaultStructTest {
    val: HasDefaults;

    init() {
        self.val = HasDefaults{};
    }
}