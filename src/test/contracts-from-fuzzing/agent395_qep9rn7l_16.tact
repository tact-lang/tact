struct OptionalChild {
    val: Int = 10;
    flag: Bool? = null;
}

struct Combo {
    m: Int?;
    n: String?;
    sub: OptionalChild?;
}

contract OptPrimOptStruct {
    store: Combo;

    init() {
        self.store = Combo{
            m: null,
            n: null,
            sub: null
        };
    }
}
