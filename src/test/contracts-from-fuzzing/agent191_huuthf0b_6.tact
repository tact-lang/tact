struct ContainsEmptyStringDefaults {
    a: String = "";
    b: String = "";
    c: String = "";
}

contract TestContract {
    data: ContainsEmptyStringDefaults;

    init() {
        self.data = ContainsEmptyStringDefaults{};
    }
}