struct DefaultOptional {
    flag: Bool? = null;
    txt: String = "hello";
}

contract DefaultOptionalTest {
    d: DefaultOptional;

    init() {
        self.d = DefaultOptional{};
    }
}