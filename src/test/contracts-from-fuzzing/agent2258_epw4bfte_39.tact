contract MixedOptionalDefaults {
    ai: Int? = null;
    bi: Int = 5;
    ab: Bool? = null;
    bb: Bool = true;
    receive() {
        let _ = self.bi;
    }
}