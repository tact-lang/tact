struct OptionalCombo {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
}

contract StoringCombos {
    combo: OptionalCombo;
    inner: OptionalCombo?;

    init() {
        self.combo = OptionalCombo { i:null, b:null, s:null, a:null };
        self.inner = null;
    }
}