contract OptionalStringVsEmpty {
    s: String?;
    t: String;

    init() {
        self.s = null;
        self.t = "";
    }
}