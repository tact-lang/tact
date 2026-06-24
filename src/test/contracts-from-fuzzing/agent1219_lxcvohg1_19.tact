// Contract with only one persistent String field defaulted to empty string
contract StringEmpty {
    s: String = "";

    init() {
        self.s = "nothing";
    }
}