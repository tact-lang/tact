struct DefaultVals {
    a: Int = 5;
    b: Bool = false;
    c: String = "hey";
}

contract PersistStructWithDefaults {
    df: DefaultVals;

    init() {
        self.df = DefaultVals{};
    }
}