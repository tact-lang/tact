struct HasDefaults {
    val1: Int = 101;
    val2: Int? = null;
    val3: Bool = true;
}

contract TestContract {
    d: HasDefaults;

    init() {
        self.d = HasDefaults{};
    }

    receive() {
        let _ = self.d.val1;
        let _ = self.d.val2;
        let _ = self.d.val3;
    }
}