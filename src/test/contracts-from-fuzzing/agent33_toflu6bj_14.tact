struct MixedDefaults {
    a: Int = 5;
    b: Int? = null;
    c: Bool?;
    d: String = "hi";
}

contract TestContract {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{
            a: 42,
            b: null,
            c: null,
            d: "bye"
        };
    }
}