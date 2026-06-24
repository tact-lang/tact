struct NestedDefaults {
    x: Int = 10;
    y: Bool = true;
    z: String = "abc";
}

contract TestContract {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{};
    }
}