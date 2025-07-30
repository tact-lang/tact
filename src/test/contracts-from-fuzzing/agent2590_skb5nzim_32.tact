struct ChainOptDefaults {
    a: Int? = null;
    b: Nested?;
}

struct Nested {
    c: Bool? = null;
    d: String?;
}

contract ChainOptDefaultsContract {
    s: ChainOptDefaults;
    init() {
        self.s = ChainOptDefaults{ b: null };
    }
}