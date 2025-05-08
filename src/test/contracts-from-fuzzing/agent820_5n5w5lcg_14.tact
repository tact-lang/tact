struct OptionalDefaults {
    a: Int?;
    b: Bool?;
    c: String? = "hi";
    d: Address?;
}

contract TestContract {
    opt: OptionalDefaults;
    init() {
        self.opt = OptionalDefaults{
            a: null,
            b: true,
            d: null,
        };
    }
}