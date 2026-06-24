struct DefaultOpt {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
    e: Cell? = null;
}

contract TestContract {
    val: DefaultOpt;

    init() {
        self.val = DefaultOpt{};
    }
}
