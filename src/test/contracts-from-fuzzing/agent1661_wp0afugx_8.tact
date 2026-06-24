struct DefaultsNested {
    num: Int = 77;
    str: String = "hi";
    flag: Bool = true;
}

contract DefaultsTest {
    def: DefaultsNested;

    init() {
        self.def = DefaultsNested{};
    }
}