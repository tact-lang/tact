struct HasDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
}

contract TestContract {
    val: HasDefaults;
    init() {
        self.val = HasDefaults{};
    }
}