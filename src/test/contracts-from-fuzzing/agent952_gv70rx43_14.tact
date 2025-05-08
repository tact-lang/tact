struct DefaultOpt {
    x: Int? = null;
    y: String = "abc";
}

contract T {
    d: DefaultOpt;

    init() {
        self.d = DefaultOpt{};
    }
}
