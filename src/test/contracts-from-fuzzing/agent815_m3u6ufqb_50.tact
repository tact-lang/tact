struct DefaultAndOptional {
    a: Int = 1;
    b: Int? = null;
    c: String = "hi";
    d: String? = null;
}

contract DefaultAndOptionalStore {
    s: DefaultAndOptional;

    init() {
        self.s = DefaultAndOptional{};
    }
}