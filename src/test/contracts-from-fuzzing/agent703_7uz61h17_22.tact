struct DefaultOpt {
    a: Int? = null;
    b: String? = null;
}

contract DefaultNestedOptional {
    val: DefaultOpt;

    init() {
        self.val = DefaultOpt{};
    }
}