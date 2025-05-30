struct NestedDefaults {
    a: Int = 1;
    b: String = "hello";
    c: Bool = true;
}

contract Test {
    defVal: NestedDefaults;
    init() {
        self.defVal = NestedDefaults{};
    }
}