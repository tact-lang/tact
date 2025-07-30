struct NestedDefaults {
    innerInt: Int = 9;
    innerStr: String = "nest";
}

contract NestedDefaultStructContract {
    st: NestedDefaults;

    init() {
        self.st = NestedDefaults{};
    }
}