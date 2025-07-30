struct TestDefault {
    num: Int = 42;
    flag: Bool = true;
    optStr: String? = null;
    fixedStr: String = "hello";
}

contract DefaultsOuter {
    def: TestDefault;

    init() {
        self.def = TestDefault{};
    }
}
