struct BigDefault {
    a: Int = 1;
    b: Bool = true;
    c: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    d: String = "hello";
    e: Int? = null;
    f: Bool? = null;
}

contract BigDefaultsContract {
    def: BigDefault;

    init() {
        self.def = BigDefault{};
    }
}