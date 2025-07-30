contract CombinedOption {
    i: Int? as uint128;
    s: String?;
    init() {
        self.i = 10000;
        self.s = "hello";
    }
}