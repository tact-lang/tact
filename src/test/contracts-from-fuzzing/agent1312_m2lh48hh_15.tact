struct InitDefaults {
    a: Int = 5;
    b: String = "hello";
    c: Bool = true;
}

contract TestContract {
    field: InitDefaults;

    init() {
        self.field = InitDefaults{};
    }
}