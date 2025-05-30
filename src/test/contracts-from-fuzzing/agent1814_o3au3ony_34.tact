struct Wrap {
    s: String;
}

contract OptionalWrap {
    w: Wrap?;

    init() {
        self.w = null;
    }
}
