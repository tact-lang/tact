struct DefaultOpt {
    val: Int? = null;
    flag: Bool? = false;
}

contract NestedDefaultOpt {
    config: DefaultOpt;

    init() {
        self.config = DefaultOpt{};
    }
}