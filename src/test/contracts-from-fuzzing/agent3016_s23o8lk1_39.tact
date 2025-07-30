struct OptDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    d: OptDefaults;

    init() {
        self.d = OptDefaults{
            a: null,
            b: null,
            c: null
        };
    }
}