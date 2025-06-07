struct HoldsString {
    data: String;
}

contract StringHolder {
    s: HoldsString;

    init() {
        self.s = HoldsString{ data: "some text" };
    }
}