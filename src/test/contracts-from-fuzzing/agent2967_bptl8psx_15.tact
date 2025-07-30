struct DefaultOptional {
    x: Int? = null;
    y: Bool? = null;
}

contract DefaultOptionalTest {
    val: DefaultOptional;

    init() {
        self.val = DefaultOptional{};
    }
}