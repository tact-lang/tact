struct DefaultOpt {
    val: Int? = null;
}

contract InitDefault {
    data: DefaultOpt;

    init() {
        self.data = DefaultOpt{};
    }
}