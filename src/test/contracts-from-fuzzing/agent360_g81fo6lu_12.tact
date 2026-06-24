struct HasDefaults {
    a: Int = 7;
    b: Bool = true;
    c: String = "hi";
}

contract TestContract {
    val: HasDefaults;

    init() {
        self.val = HasDefaults{};
    }
}