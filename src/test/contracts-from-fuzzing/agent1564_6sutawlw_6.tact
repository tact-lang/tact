struct HasDefault {
    num: Int = 42;
    txt: String = "hello";
    yes: Bool = true;
}

contract StructWithDefaults {
    data: HasDefault;

    init() {
        self.data = HasDefault{};
    }
}