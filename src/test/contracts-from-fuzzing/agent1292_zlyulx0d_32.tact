struct DefaultsWithOpt {
    flag: Bool = true;
    data: Int? = null;
}

contract DefaultsOptMix {
    content: DefaultsWithOpt;

    init() {
        self.content = DefaultsWithOpt{};
    }
}