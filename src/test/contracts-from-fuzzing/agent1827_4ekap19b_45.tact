contract OptStrAndStrMix {
    optStr: String?;
    plainStr: String;

    init() {
        self.optStr = null;
        self.plainStr = "plain";
    }
}