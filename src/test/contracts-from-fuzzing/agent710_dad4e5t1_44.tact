struct DefaultAndOpt {
    a: Int = 0;
    b: Bool? = null;
}

contract TestContract {
    val: DefaultAndOpt = DefaultAndOpt{};

    init() {
        self.val = DefaultAndOpt{ a: 55, b: true };
    }
}