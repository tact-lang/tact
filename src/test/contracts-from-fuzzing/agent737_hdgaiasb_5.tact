struct HasDefaults {
    a: Int = 5;
    b: String = "hello";
    c: Bool = true;
}

contract TestContract {
    myField: HasDefaults;

    init() {
        self.myField = HasDefaults{};
    }
}
