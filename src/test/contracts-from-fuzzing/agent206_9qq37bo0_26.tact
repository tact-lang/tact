struct Complicated {
    a: Int = 10;
    b: Bool? = null;
    c: String = "hi";
    d: Address?;
    e: Bool = true;
    f: Int?;
    g: String? = null;
}

contract ComplicatedDefaults {
    data: Complicated;

    init() {
        self.data = Complicated{
            d: null,
            f: null
        };
    }
}
