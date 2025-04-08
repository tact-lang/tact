struct StringDefaults {
    a: String = "";
    b: String = "hello";
}

contract StringDefaultsContract {
    d: StringDefaults;

    init() {
        self.d = StringDefaults{};
    }

    receive() {
        self.d = StringDefaults{a:"x",b:"y"};
    }
}