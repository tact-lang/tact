struct DefaultedOpt {
    val: Int? = null;
    flag: Bool? = true;
}

contract Test16 {
    data: DefaultedOpt;
    init() {
        self.data = DefaultedOpt{};
    }
}
