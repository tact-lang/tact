struct DefaultOptional {
    s: String? = null;
    b: Bool? = false;
    i: Int? = 0;
    a: Address? = null;
}

contract DefaultOptionalContract {
    data: DefaultOptional;

    init() {
        self.data = DefaultOptional{};
    }
}