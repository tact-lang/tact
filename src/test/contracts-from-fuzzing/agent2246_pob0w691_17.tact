struct DefaultOpt {
    x: Int? = null;
    y: String? = "hello";
}

contract DefOptCombine {
    data: DefaultOpt;

    init() {
        self.data = DefaultOpt{};
    }
}
