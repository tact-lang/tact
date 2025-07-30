struct OptDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptDefContract {
    val: OptDefaults;

    init() {
        self.val = OptDefaults{ a: null, b: null, c: null, d: null };
    }
}