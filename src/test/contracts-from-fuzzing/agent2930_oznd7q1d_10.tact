struct EmbeddedDefaults {
    a: Int = 42;
    b: Bool = false;
    c: String = "hi";
    d: Address;
}

contract InitWithDefaults {
    emb: EmbeddedDefaults;

    init() {
        self.emb = EmbeddedDefaults{
            d: myAddress()
        };
    }
}
