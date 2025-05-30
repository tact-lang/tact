struct NestedDefaults {
    num: Int = 0;
    flag: Bool = false;
    text: String = "";
}

contract Defaulted {
    data: NestedDefaults;
    init() {
        self.data = NestedDefaults{};
    }
}