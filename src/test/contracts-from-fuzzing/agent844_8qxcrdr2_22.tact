struct InlineDefaults {
    a: Int = 7;
    b: Bool = false;
    c: String = "hip";
    d: Int?;
}

contract DefaultsNestedOptional {
    inner: InlineDefaults?;

    init() {
        self.inner = null;
    }

    receive() {
        let _ = self.inner;
    }
}
