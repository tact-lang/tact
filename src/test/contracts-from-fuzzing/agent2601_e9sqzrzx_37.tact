struct WrappedString {
    txt: String;
}
contract StringWrap {
    s: WrappedString;
    init() {
        self.s = WrappedString{ txt: "hi" };
    }
}