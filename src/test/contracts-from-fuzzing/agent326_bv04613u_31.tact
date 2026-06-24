struct CombDefaults {
    intF: Int = 1;
    boolF: Bool = true;
    strF: String = "a";
    optInt: Int? = null;
}

contract CombDefTest {
    x: CombDefaults;

    init() {
        self.x = CombDefaults{};
    }
}
