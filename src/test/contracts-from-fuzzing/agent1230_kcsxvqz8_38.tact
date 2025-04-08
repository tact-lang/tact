struct DefaultNestedOptional {
    a: Int? = null;
    b: Bool = false;
}

contract DNOTest {
    f: DefaultNestedOptional;

    init() {
        self.f = DefaultNestedOptional{};
    }
}