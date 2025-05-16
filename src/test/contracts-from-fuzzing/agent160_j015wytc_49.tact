struct OptionalAndDefaults {
    a: Int?;
    b: Bool = false;
}

contract StoreStructOptDefaults {
    s: OptionalAndDefaults;
    init() {
        self.s = OptionalAndDefaults{
            a: null
        };
    }
}