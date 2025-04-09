struct StringWrap {
    s: String;
}

contract StringOpt {
    data: StringWrap?;

    init() {
        self.data = null;
    }
}