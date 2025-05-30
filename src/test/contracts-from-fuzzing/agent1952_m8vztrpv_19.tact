struct ChainDefaults {
    a: Int = 5;
    b: Bool? = null;
    c: String = "abc";
    d: Int? = 999;
}

contract TestContract {
    chain: ChainDefaults;

    init() {
        self.chain = ChainDefaults{};
    }
}
