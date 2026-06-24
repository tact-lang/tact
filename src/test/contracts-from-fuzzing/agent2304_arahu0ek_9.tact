struct DefaultOpt {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract DefaultedOptionals {
    val: DefaultOpt;

    init() {
        self.val = DefaultOpt{};
    }
}