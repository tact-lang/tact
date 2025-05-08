struct DefaultOpt {
    val: Int? = null;
    text: String? = null;
    flag: Bool? = null;
}

contract DefaultsOptional {
    data: DefaultOpt;

    init() {
        self.data = DefaultOpt{};
    }
}
