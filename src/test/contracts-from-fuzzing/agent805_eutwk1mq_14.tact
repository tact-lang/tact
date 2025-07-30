struct WeirdOptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    d: Cell? = null;
    e: String? = null;
}

contract TestContract {
    data: WeirdOptDefaults;

    init() {
        self.data = WeirdOptDefaults{};
    }
}