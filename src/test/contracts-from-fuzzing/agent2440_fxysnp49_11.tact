struct DefaultField {
    x: Int = 12;
    y: Bool = false;
    z: String = "abc";
}

contract Defaults {
    value: DefaultField;

    init() {
        self.value = DefaultField{};
    }
}
