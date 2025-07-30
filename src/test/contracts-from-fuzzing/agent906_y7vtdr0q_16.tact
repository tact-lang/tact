struct SmallDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultVals {
    data: SmallDefaults;

    init() {
        self.data = SmallDefaults{};
    }
}