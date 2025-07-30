struct MixedDefaults {
    a: Int = 42;
    b: Bool;
    c: String?;
    d: Int? = null;
    e: Int?;
}

contract TestContract {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{
            b: false,
            c: null,
            e: 5,
        };
    }
}