struct OptionsInside {
    s: String?;
    n: Int?;
}

contract NullInStructOptional {
    inner: OptionsInside?;

    init() {
        self.inner = null;
    }
}