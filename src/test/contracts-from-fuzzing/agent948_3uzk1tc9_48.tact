struct LitDefaults {
    foo: Int = 100;
    bar: String = "zzz";
}

contract DefaultsLitTest {
    state: LitDefaults;

    init() {
        self.state = LitDefaults{};
    }
}