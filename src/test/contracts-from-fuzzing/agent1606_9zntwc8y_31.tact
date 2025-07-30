struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
    d: Int? = null;
}

contract NestedDefaultStruct {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{};
    }

    receive() {
        let d = self.data;
    }
}