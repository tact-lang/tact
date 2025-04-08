contract BoolOptionalCombined {
    flag: Bool?;
    tally: Int;

    init() {
        self.flag = null;
        self.tally = 0;
    }
}